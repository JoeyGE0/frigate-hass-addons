#!/usr/bin/env bash
# Sync the dev add-on to the latest Frigate dev branch commit with a published GHCR image.
set -euo pipefail

ADDON_DIR="${1:?add-on directory required}"
GHCR_IMAGE="${GHCR_IMAGE:-ghcr.io/blakeblackshear/frigate}"

image_ready() {
  local short_sha="$1"
  local status
  status=$(curl -sI \
    -H "Authorization: Bearer ${GHCR_TOKEN}" \
    -H "Accept: application/vnd.oci.image.index.v1+json" \
    "https://ghcr.io/v2/${GHCR_IMAGE}/manifests/${short_sha}" \
    | head -1)
  echo "$status" | grep -q "200"
}

current=$(grep '^version:' "${ADDON_DIR}/config.yaml" | sed -E 's/^version: "?([^"]+)"?/\1/')

GHCR_TOKEN=$(curl -fsSL \
  "https://ghcr.io/token?service=ghcr.io&scope=repository:${GHCR_IMAGE}:pull" \
  | jq -r .token)

commits=$(curl -fsSL "https://api.github.com/repos/blakeblackshear/frigate/commits?sha=dev&per_page=50")
target_short=""
target_full=""

while IFS=$'\t' read -r short_sha full_sha; do
  if image_ready "$short_sha"; then
    target_short="$short_sha"
    target_full="$full_sha"
    break
  fi
  echo "Skipping ${short_sha}: GHCR image not published yet." >&2
done < <(echo "$commits" | jq -r '.[] | "\(.sha[:7])\t\(.sha)"')

if [ -z "$target_short" ]; then
  echo "No published GHCR image found for recent Frigate dev commits." >&2
  exit 1
fi

if [ "$current" = "$target_short" ]; then
  echo "No update needed for ${ADDON_DIR} (already ${target_short})." >&2
  exit 0
fi

echo "Updating ${ADDON_DIR} from ${current} to ${target_short}." >&2

target_compare=$(curl -fsSL \
  "https://api.github.com/repos/blakeblackshear/frigate/compare/${current}...${target_full}")
commit_count=$(echo "$target_compare" | jq -r '.total_commits // 0')

sed -i "s/^version: .*/version: \"${target_short}\"/" "${ADDON_DIR}/config.yaml"

notes_file=$(mktemp)
{
  echo "### ${target_short}"
  echo
  echo "- Track Frigate dev branch commit [${target_short}](https://github.com/blakeblackshear/frigate/commit/${target_full})"
  echo
  echo "- GHCR image \`${GHCR_IMAGE}:${target_short}\` is available"
  echo

  if [ "$commit_count" -gt 0 ]; then
    echo "#### Changes (${commit_count} commit(s))"
    echo
    echo "$target_compare" | jq -r '.commits[] | "- \(.commit.message | split("\n")[0]) ([\(.sha[:7])](https://github.com/blakeblackshear/frigate/commit/\(.sha)))"'
    echo
  fi

  if [ -f "${ADDON_DIR}/CHANGELOG.md" ]; then
    awk -v version="### ${target_short}" '
      $0 == version { skip = 1; next }
      skip && /^### / { skip = 0 }
      !skip { print }
    ' "${ADDON_DIR}/CHANGELOG.md"
  fi
} > "${notes_file}"

mv "${notes_file}" "${ADDON_DIR}/CHANGELOG.md"
echo "$(basename "${ADDON_DIR}")=${target_short}"
