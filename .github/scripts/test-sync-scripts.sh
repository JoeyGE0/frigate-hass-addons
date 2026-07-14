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
  perl -i -pe "s/^version: .*/version: \"${version}\"/" "$tmpdir/$addon/config.yaml"
}

echo "Testing release sync update path..."
releases=$(curl -fsSL "https://api.github.com/repos/blakeblackshear/frigate/releases?per_page=5")
stable_json=$(echo "$releases" | jq '[.[] | select(.draft == false and .prerelease == false)][0]')
stable_tag=$(echo "$stable_json" | jq -r '.tag_name' | sed 's/^v//')
previous_stable_tag=$(echo "$releases" | jq -r '[.[] | select(.draft == false and .prerelease == false)][1].tag_name' | sed 's/^v//')
setup_addon frigate "$previous_stable_tag"
result=$(.github/scripts/sync-frigate-release.sh "$tmpdir/frigate" "$stable_json")
test "$result" = "frigate=${stable_tag}"
grep -q "^version: ${stable_tag}$" "$tmpdir/frigate/config.yaml"
grep -q "### ${stable_tag}" "$tmpdir/frigate/CHANGELOG.md"
grep -q "What's Changed" "$tmpdir/frigate/CHANGELOG.md"

echo "Testing release sync no-op path..."
setup_addon frigate "$stable_tag"
if .github/scripts/sync-frigate-release.sh "$tmpdir/frigate" "$stable_json" >/dev/null; then
  echo "Release no-op passed."
else
  echo "Release no-op failed." >&2
  exit 1
fi

echo "Testing dev sync update path..."
setup_addon frigate_fa_dev "e84a89e"
# copy overlay build.yaml so sync can bump Frigate tags (JoeyGE0 custom go2rtc)
if [ -f frigate_fa_dev/build.yaml ]; then
  cp frigate_fa_dev/build.yaml "$tmpdir/frigate_fa_dev/build.yaml"
fi
result=$(GHCR_IMAGE=ghcr.io/blakeblackshear/frigate .github/scripts/sync-frigate-dev.sh "$tmpdir/frigate_fa_dev")
dev_head=$(curl -fsSL "https://api.github.com/repos/blakeblackshear/frigate/commits/dev" | jq -r '.sha[:7]')
# JoeyGE0 fork keeps -aac1 so HA rebuilds with custom go2rtc overlay
test "$result" = "frigate_fa_dev=${dev_head}-aac1"
grep -q "^version: \"${dev_head}-aac1\"$" "$tmpdir/frigate_fa_dev/config.yaml"
grep -q '#### Changes' "$tmpdir/frigate_fa_dev/CHANGELOG.md"
if [ -f "$tmpdir/frigate_fa_dev/build.yaml" ]; then
  grep -q "frigate:${dev_head}" "$tmpdir/frigate_fa_dev/build.yaml"
fi

echo "Testing dev sync no-op path..."
setup_addon frigate_fa_dev "${dev_head}-aac1"
if GHCR_IMAGE=ghcr.io/blakeblackshear/frigate .github/scripts/sync-frigate-dev.sh "$tmpdir/frigate_fa_dev" >/dev/null; then
  echo "Dev no-op passed."
else
  echo "Dev no-op failed." >&2
  exit 1
fi

echo "All sync script smoke tests passed."
