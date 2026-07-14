#!/usr/bin/env bash
# Sync the dev add-on to the latest Frigate dev branch commit.
# JoeyGE0 fork: keep Dockerfile go2rtc overlay; versions are "{sha}-aac1".
set -euo pipefail

ADDON_DIR="${1:?add-on directory required}"
GHCR_IMAGE="${GHCR_IMAGE:-ghcr.io/blakeblackshear/frigate}"
AAC_SUFFIX="-aac1"

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

raw_version=$(grep '^version:' "${ADDON_DIR}/config.yaml" | sed -E 's/^version: "?([^"]+)"?/\1/')
# Strip optional -aac* suffix for Frigate compare API
current="${raw_version%%-aac*}"

response=$(curl -fsSL "https://api.github.com/repos/blakeblackshear/frigate/commits/dev")
target_short=$(echo "$response" | jq -r '.sha[:7]')
target_full=$(echo "$response" | jq -r '.sha')

if [ "$current" = "$target_short" ]; then
  echo "No update needed for ${ADDON_DIR} (already ${target_short}${AAC_SUFFIX})." >&2
  exit 0
fi

echo "Updating ${ADDON_DIR} from ${raw_version} to ${target_short}${AAC_SUFFIX}." >&2

GHCR_TOKEN=$(curl -fsSL \
  "https://ghcr.io/token?service=ghcr.io&scope=repository:${GHCR_IMAGE}:pull" \
  | jq -r .token)

target_compare=$(curl -fsSL \
  "https://api.github.com/repos/blakeblackshear/frigate/compare/${current}...${target_full}")
commit_count=$(echo "$target_compare" | jq -r '.total_commits // 0')

sed -i "s/^version: .*/version: \"${target_short}${AAC_SUFFIX}\"/" "${ADDON_DIR}/config.yaml"

# Keep go2rtc overlay build_from in sync with Frigate tag
if [ -f "${ADDON_DIR}/build.yaml" ]; then
  sed -i -E "s|(ghcr.io/blakeblackshear/frigate:)[a-z0-9]+|\\1${target_short}|g" "${ADDON_DIR}/build.yaml"
fi

notes_file=$(mktemp)
{
  echo "### ${target_short}${AAC_SUFFIX}"
  echo
  echo "- Track Frigate dev branch commit [${target_short}](https://github.com/blakeblackshear/frigate/commit/${target_full})"
  echo "- Retains JoeyGE0 custom go2rtc overlay (ISAPI AAC talk) via Dockerfile"
  echo

  if image_ready "$target_short"; then
    echo "- GHCR image \`${GHCR_IMAGE}:${target_short}\` is available"
  else
    echo "- GHCR image \`${GHCR_IMAGE}:${target_short}\` is not published yet; the add-on may not install until Frigate builds it"
  fi
  echo

  if [ "$commit_count" -gt 0 ]; then
    echo "#### Changes (${commit_count} commit(s))"
    echo
    echo "$target_compare" | jq -r '.commits[] | "- \(.commit.message | split("\n")[0]) ([\(.sha[:7])](https://github.com/blakeblackshear/frigate/commit/\(.sha)))"'
    echo
  fi

  if [ -f "${ADDON_DIR}/CHANGELOG.md" ]; then
    awk -v version="### ${target_short}${AAC_SUFFIX}" '
      $0 == version { skip = 1; next }
      skip && /^### / { skip = 0 }
      !skip { print }
    ' "${ADDON_DIR}/CHANGELOG.md"
  fi
} > "${notes_file}"

mv "${notes_file}" "${ADDON_DIR}/CHANGELOG.md"

# Also commit build.yaml when present
if [ -f "${ADDON_DIR}/build.yaml" ]; then
  echo "$(basename "${ADDON_DIR}")=${target_short}${AAC_SUFFIX}"
else
  echo "$(basename "${ADDON_DIR}")=${target_short}${AAC_SUFFIX}"
fi
