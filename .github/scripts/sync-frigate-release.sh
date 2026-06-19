#!/usr/bin/env bash
# Sync a Home Assistant add-on directory to a Frigate GitHub release version.
set -euo pipefail

ADDON_DIR="${1:?add-on directory required}"
RELEASE_JSON="${2:?release JSON required}"

version=$(echo "$RELEASE_JSON" | jq -r '.tag_name' | sed 's/^v//')
tag_name=$(echo "$RELEASE_JSON" | jq -r '.tag_name')
release_url="https://github.com/blakeblackshear/frigate/releases/tag/${tag_name}"
release_body=$(echo "$RELEASE_JSON" | jq -r '.body // ""')

current=$(grep '^version:' "${ADDON_DIR}/config.yaml" | sed -E 's/^version: "?([^"]+)"?/\1/')

if [ "$current" = "$version" ]; then
  echo "No update needed for ${ADDON_DIR} (already ${version})." >&2
  exit 0
fi

echo "Updating ${ADDON_DIR} from ${current} to ${version}." >&2

sed -i "s/^version: .*/version: ${version}/" "${ADDON_DIR}/config.yaml"

notes_file=$(mktemp)
{
  echo "### ${version}"
  echo
  echo "- Update to ${version} [release notes](${release_url})"
  echo

  if [ -n "$release_body" ]; then
    formatted=$(printf '%s' "$release_body" | awk '
      BEGIN { printing = 0 }
      /^## Images[[:space:]]*$/ { printing = 0; next }
      /^## / { printing = 1 }
      printing { print }
    ')

    if [ -n "$formatted" ]; then
      printf '%s\n' "$formatted"
      echo
    fi
  fi

  if [ -f "${ADDON_DIR}/CHANGELOG.md" ]; then
    cat "${ADDON_DIR}/CHANGELOG.md"
  fi
} > "${notes_file}"

mv "${notes_file}" "${ADDON_DIR}/CHANGELOG.md"
echo "${ADDON_DIR}=${version}"
