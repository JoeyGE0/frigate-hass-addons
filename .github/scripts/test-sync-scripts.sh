#!/usr/bin/env bash
# Smoke tests for add-on sync scripts used in CI.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

chmod +x .github/scripts/sync-frigate-release.sh
chmod +x .github/scripts/sync-frigate-dev.sh

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

setup_addon() {
  local addon="$1"
  local version="$2"
  mkdir -p "$tmpdir/$addon"
  cp "$addon/config.yaml" "$tmpdir/$addon/config.yaml"
  cp "$addon/CHANGELOG.md" "$tmpdir/$addon/CHANGELOG.md"
  sed -i "s/^version: .*/version: \"${version}\"/" "$tmpdir/$addon/config.yaml"
}

echo "Testing release sync update path..."
releases=$(curl -fsSL "https://api.github.com/repos/blakeblackshear/frigate/releases?per_page=5")
stable_json=$(echo "$releases" | jq '[.[] | select(.draft == false and .prerelease == false)][0]')
setup_addon frigate "0.17.0"
result=$(.github/scripts/sync-frigate-release.sh "$tmpdir/frigate" "$stable_json")
test "$result" = "frigate=0.17.1"
grep -q '^version: 0.17.1$' "$tmpdir/frigate/config.yaml"
grep -q '### 0.17.1' "$tmpdir/frigate/CHANGELOG.md"
grep -q "What's Changed" "$tmpdir/frigate/CHANGELOG.md"

echo "Testing release sync no-op path..."
setup_addon frigate "0.17.1"
if .github/scripts/sync-frigate-release.sh "$tmpdir/frigate" "$stable_json" >/dev/null; then
  echo "Release no-op passed."
else
  echo "Release no-op failed." >&2
  exit 1
fi

echo "Testing dev sync update path..."
setup_addon frigate_fa_dev "e84a89e"
result=$(GHCR_IMAGE=ghcr.io/blakeblackshear/frigate .github/scripts/sync-frigate-dev.sh "$tmpdir/frigate_fa_dev")
GHCR_TOKEN=$(curl -fsSL "https://ghcr.io/token?service=ghcr.io&scope=repository:blakeblackshear/frigate:pull" | jq -r .token)
dev_target=""
commits=$(curl -fsSL "https://api.github.com/repos/blakeblackshear/frigate/commits?sha=dev&per_page=50")
while IFS=$'\t' read -r short_sha _full_sha; do
  status=$(curl -sI \
    -H "Authorization: Bearer ${GHCR_TOKEN}" \
    -H "Accept: application/vnd.oci.image.index.v1+json" \
    "https://ghcr.io/v2/blakeblackshear/frigate/manifests/${short_sha}" \
    | head -1)
  if echo "$status" | grep -q "200"; then
    dev_target="$short_sha"
    break
  fi
done < <(echo "$commits" | jq -r '.[] | "\(.sha[:7])\t\(.sha)"')
test -n "$dev_target"
test "$result" = "frigate_fa_dev=${dev_target}"
grep -q "^version: \"${dev_target}\"$" "$tmpdir/frigate_fa_dev/config.yaml"
grep -q 'GHCR image' "$tmpdir/frigate_fa_dev/CHANGELOG.md"

echo "Testing dev sync no-op path..."
setup_addon frigate_fa_dev "$dev_target"
if GHCR_IMAGE=ghcr.io/blakeblackshear/frigate .github/scripts/sync-frigate-dev.sh "$tmpdir/frigate_fa_dev" >/dev/null; then
  echo "Dev no-op passed."
else
  echo "Dev no-op failed." >&2
  exit 1
fi

echo "All sync script smoke tests passed."
