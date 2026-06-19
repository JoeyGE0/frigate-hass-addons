#!/usr/bin/env bash
# Create missing GitHub releases for all add-on versions in this repository.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

addons=(
  frigate
  frigate_fa
  frigate_beta
  frigate_fa_beta
  frigate_fa_dev
)

extract_changelog_section() {
  local changelog="$1"
  local version="$2"

  awk -v version="### ${version}" '
    $0 == version { printing = 1; print; next }
    printing && /^### / { exit }
    printing { print }
  ' "$changelog"
}

for addon in "${addons[@]}"; do
  config="${addon}/config.yaml"
  changelog="${addon}/CHANGELOG.md"

  [ -f "$config" ] || continue

  name=$(grep '^name:' "$config" | sed 's/^name: //')
  slug=$(grep '^slug:' "$config" | awk '{print $2}')
  version=$(grep '^version:' "$config" | sed -E 's/^version: "?([^"]+)"?/\1/')
  tag="${slug}-${version}"
  title="${name} ${version}"

  if gh release view "$tag" >/dev/null 2>&1; then
    echo "Release ${tag} already exists, skipping."
    continue
  fi

  notes_file=$(mktemp)
  {
    echo "Add-on release for \`${slug}\`."
    echo
    if [ -f "$changelog" ]; then
      extract_changelog_section "$changelog" "$version"
    else
      echo "Version ${version}."
    fi
  } > "$notes_file"

  prerelease_flag=()
  if [[ "$version" =~ [Bb]eta|[Rr][Cc] ]] || [[ "$addon" == *"_dev"* ]] || [[ "$slug" == *"-dev"* ]]; then
    prerelease_flag=(--prerelease)
  fi

  echo "Creating release ${tag}..."
  gh release create "$tag" \
    --title "$title" \
    --notes-file "$notes_file" \
    --target main \
    "${prerelease_flag[@]}"

  rm -f "$notes_file"
done
