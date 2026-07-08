### 0.17.2

- Update to 0.17.2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.17.2)

## What's Changed

### Security Advisories

These advisories impact users with publicly exposed instances with no authentication and users with viewer roles where it is important to restrict access to some cameras.

Addressed in this release:

- [go2rtc WebSocket live stream camera access bypass (role-restricted users)](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-hh3j-7g2f-43j2)
- [Incomplete patch of CVE-2025-62382: `image_path` backslash-separator bypass of `pathvalidate.sanitize_filepath` + `startswith(CLIPS_DIR)` reaches `shutil.copy` arbitrary host-file read](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-pqfr-m69j-4mq2)
- [Incomplete patch of CVE-2026-25643: go2rtc exec:/echo:/expr: prefix block is bypassed when a stream value is a YAML mapping with a `url` key (RCE + container escape)](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-r57j-5jm9-hpcc)
- [RTSP credentials leak to viewer role via nginx proxy_cache](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-4vfc-hxpj-f7x7)
- [Authenticated Admin Can Achieve RCE via go2rtc Stream API — exec: Filter Not Enforced at API Layer](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-wwww-5h25-jf98)
- [WebSocket Missing Authorization — Viewer Can Execute Admin-Only Operations](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-r5fm-h944-8chq)

To be addressed in future versions:

- [Authenticated viewer can read /api/logs/frigate and /api/logs/nginx, exposing the auto-generated admin password and camera RTSP/ONVIF credentials (viewer-to-admin privilege escalation)](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-c4qf-xxq4-vf55)
- [Viewer-Role User Can Access go2rtc Internal API to obtain sensitive information](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-mgh5-cr9h-g6hr)
- [Camera ACL bypass via Nginx static locations allows authenticated users to access recordings from unauthorized cameras](https://github.com/blakeblackshear/frigate/security/advisories/GHSA-74x4-gw64-2mq5)

### Notable Changes

- Exports can optionally include recording segment information as chapters in mp4 metadata
- Performance improvements when displaying previews in the live page

### All Commits
* Update docs for DEIMv2 support by @NickM-27 in https://github.com/blakeblackshear/frigate/pull/22598
* Add role-based auth to websocket message handler by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/22710
* Update MemryX section documentation by @abinila4 in https://github.com/blakeblackshear/frigate/pull/22712
* Memryx docs update by @abinila4 in https://github.com/blakeblackshear/frigate/pull/22746
* Docs update by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/22864
* Update restream.md docs and clarify output config by @Feni85 in https://github.com/blakeblackshear/frigate/pull/22860
* Fix broken docs links with hash fragments that resolve wrong on reload by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/22925
* Fix yolonas colab notebook by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/22936
* Fixes by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/23235
* Add metadata for creation time in recordings / exports by @NickM-27 in https://github.com/blakeblackshear/frigate/pull/23239
* Fix admin response cache leak to non-admin users via nginx proxy_cache by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/23261
* Docs update by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/23280
* Docs update by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/23282
* Filter motion review by allowed cameras by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/23294
* Add ability to control chapters set on MP4 Export by @NickM-27 in https://github.com/blakeblackshear/frigate/pull/23310
* Chapter tweaks by @NickM-27 in https://github.com/blakeblackshear/frigate/pull/23440
* Catch edge cases in security protections by @NickM-27 in https://github.com/blakeblackshear/frigate/pull/23493
* Offload preview encoding and Plus upload off the API event loop by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/23552
* Fix cache control header for current hour preview mp4s by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/23553
* Allow non-admin users to use PTZ controls for cameras they have access to by @hawkeye217 in https://github.com/blakeblackshear/frigate/pull/23578

## New Contributors
* @Feni85 made their first contribution in https://github.com/blakeblackshear/frigate/pull/22860

**Full Changelog**: https://github.com/blakeblackshear/frigate/compare/v0.17.1...v0.17.2

### 0.17.1

- Update to 0.17.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.17.1)

### 0.17.0

- Update to 0.17.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.17.0)

### 0.16.4

- Update to 0.16.4 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.4)

### 0.16.3

- Update to 0.16.3 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.3)

### 0.16.2

- Update to 0.16.2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.2)

### 0.16.1

- Update to 0.16.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.1)

### 0.16.0

- Update to 0.16.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0)

### 0.15.2

- Update to 0.15.2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.2)

### 0.15.1

- Update to 0.15.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.1)

### 0.15.0

- Update to 0.15.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0)

### 0.14.1

- Update to 0.14.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.1)

### 0.14.0

- Update to 0.14.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.0)

### 0.13.2

- Update to 0.13.2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.2)

### 0.13.1

- Update to 0.13.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.1)

### 0.13.0

- Update to 0.13.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0)

### 0.12.1

- Update to 0.12.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.1)

### 0.12.0

- Update to 0.12.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0)

### 0.11.1

- Update to 0.11.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.1)

### 0.11.0

- If the upgrade fails with "Invalid build environment, can't build this add-on!". Try uninstalling and reinstalling the addon instead.
- Update to 0.11.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0)

### 3.1

- Update to 0.10.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.1)

### 3.0

- Update to 0.10.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0)

### 2.3

- Set side panel name to Frigate

### 2.2

- Update to 0.9.4 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.9.4)

### 2.1

- Update to 0.9.3 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.9.3)
- Add /dev/video10 to requested devices for hwaccel

### 2.0

- BREAKING CHANGES: Update to 0.9.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.9.1)
- This also requires an update to the Home Assistant integration (custom component)

### 1.14

- Allow access to side panel for non-admins
- Add additional apex devices

### 1.13

- Update to 0.8.4

### 1.12

- Use new tmpfs config option

### 1.11

- Update to 0.8.3

### 1.10

- Update device config to avoid protection mode to be disabled for Coral access
- Add additional devices in hopes that protection mode can be enabled on RPi with hwaccel

### 1.9

- Update to avoid deprecation warning for new devices config
- Skip version to reduce confusion about the beta being newer than stable

### 1.7

- Fixes for supervisor 2021.02.5
- Configuration moved to Home Assistant config directory as `frigate.yml`

### 1.6

- Update to 0.8.1
- Better ffmpeg log handling
- WebUI fixes and improvements

### 1.5

- Config fixes for 0.8.0

### 1.4 - MAJOR BREAKING CHANGES

- Update to 0.8.0

### 1.3

- Update to 0.7.3

### 1.2

- Update to 0.7.2
- Support for PCI Coral devices

### 1.1

- Update to 0.7.1

### 1.0

- Initial release
