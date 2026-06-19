#!/usr/bin/env bash
# Create GitHub releases for add-ons updated in the latest commit.
set -euo pipefail

if ! git rev-parse HEAD >/dev/null 2>&1; then
  echo "No git repository available."
  exit 1
fi

mapfile -t addons < <(
  git diff-tree --no-commit-id --name-only -r HEAD \
    | awk -F/ '$2 == "config.yaml" { print $1 }' \
    | sort -u
)

if [ "${#addons[@]}" -eq 0 ]; then
  echo "No add-on config changes in the latest commit."
  exit 0
fi

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

  if [ ! -f "$config" ]; then
    echo "Skipping ${addon}: missing config.yaml"
    continue
  fi

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
    echo "Automated add-on release for \`${slug}\`."
    echo
    if [ -f "$changelog" ]; then
      extract_changelog_section "$changelog" "$version"
    else
      echo "Update to ${version}."
    fi
  } > "$notes_file"

  prerelease_flag=()
  if [[ "$version" =~ [Bb]eta|[Rr][Cc] ]]; then
    prerelease_flag=(--prerelease)
  fi

  echo "Creating release ${tag}..."
  gh release create "$tag" \
    --title "$title" \
    --notes-file "$notes_file" \
    --target "$(git rev-parse HEAD)" \
    "${prerelease_flag[@]}"

  rm -f "$notes_file"
  echo "Created https://github.com/${GITHUB_REPOSITORY}/releases/tag/${tag}"
done
