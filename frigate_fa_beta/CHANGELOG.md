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

### 0.17.0-rc3

- Update to 0.17.0-rc3 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.17.0-rc3)

### 0.17.0-rc2

- Update to 0.17.0-rc2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.17.0-rc2)

### 0.17.0-rc1

- Update to 0.17.0-rc1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.17.0-rc1)

### 0.17.0-beta2

- Update to 0.17.0-beta2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.17.0-beta2)

### 0.17.0-beta1

- Update to 0.17.0-beta1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.17.0-beta1)

### 0.16.3

- Update to 0.16.3 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.3)

### 0.16.2

- Update to 0.16.2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.2)

### 0.16.1

- Update to 0.16.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.1)

### 0.16.0

- Update to 0.16.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0)

### 0.16.0-rc4

- Update to 0.16.0-rc4 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0-rc4)

### 0.16.0-rc3

- Update to 0.16.0-rc3 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0-rc3)

### 0.16.0-rc2

- Update to 0.16.0-rc2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0-rc2)

### 0.16.0-rc1

- Update to 0.16.0-rc1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0-rc1)

### 0.16.0-beta4

- Update to 0.16.0-beta4 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0-beta4)

### 0.16.0-beta3

- Update to 0.16.0-beta3 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0-beta3)

### 0.16.0-beta2

- Update to 0.16.0-beta2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0-beta2)

### 0.16.0-beta1

- Update to 0.16.0-beta1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.16.0-beta1)

### 0.15.1

- Update to 0.15.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.1)

### 0.15.0

- Update to 0.15.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0)

### 0.15.0-rc2

- Update to 0.15.0-rc2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0-rc2)

### 0.15.0-rc1

- Update to 0.15.0-rc1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0-rc1)

### 0.15.0-beta5

- Update to 0.15.0-beta5 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0-beta5)

### 0.15.0-beta4

- Update to 0.15.0-beta4 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0-beta4)

### 0.15.0-beta3

- Update to 0.15.0-beta3 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0-beta3)

### 0.15.0-beta2

- Update to 0.15.0-beta2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0-beta2)

### 0.15.0-beta1

- Update to 0.15.0-beta1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.15.0-beta1)

### 0.14.1

- Update to 0.14.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.1)

### 0.14.0

- Update to 0.14.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.0)

### 0.14.0-rc1

- Update to 0.14.0-rc1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.0-rc1)

### 0.14.0-beta4

- Update to 0.14.0-beta4 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.0-beta4)

### 0.14.0-beta3

- Update to 0.14.0-beta3 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.0-beta3)

### 0.14.0-beta2

- Update to 0.14.0-beta2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.0-beta2)

### 0.14.0-beta1

- Update to 0.14.0-beta1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.14.0-beta1)

### 0.13.2

- Update to 0.13.2 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.2)

### 0.13.1

- Update to 0.13.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.1)

### 0.13.0

- Update to 0.13.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0)

### 0.13.0-rc1

- Update to 0.13.0 Release Candidate 1 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0-rc1)

### 0.13.0-beta7

- Update to 0.13.0 Beta 7 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0-beta7)

### 0.13.0-beta6

- Update to 0.13.0 Beta 6 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0-beta6)

### 0.13.0-beta5

- Update to 0.13.0 Beta 5 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0-beta5)

### 0.13.0-beta4

- Update to 0.13.0 Beta 4 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0-beta4)

### 0.13.0-beta3

- Update to 0.13.0 Beta 3 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0-beta3)

### 0.13.0-beta2

- Update to 0.13.0 Beta 2 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0-beta2)

### 0.13.0-beta1

- Update to 0.13.0 Beta 1 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.13.0-beta1)

### 0.12.0-rc2

- Update to 0.12.0 Release Candidate 2 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-rc2)

### 0.12.0-rc1

- Update to 0.12.0 Release Candidate 1 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-rc1)

### 0.12.0-beta10

- Update to 0.12.0 Beta 10 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta10)

### 0.12.0-beta9

- Update to 0.12.0 Beta 9 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta9)

### 0.12.0-beta8

- Update to 0.12.0 Beta 8 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta8)

### 0.12.0-beta7

- Update to 0.12.0 Beta 7 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta7)

### 0.12.0-beta6

- Update to 0.12.0 Beta 6 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta6)

### 0.12.0-beta5

- Update to 0.12.0 Beta 5 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta5)

### 0.12.0-beta4

- Update to 0.12.0 Beta 4 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta4)

### 0.12.0-beta3

- Update to 0.12.0 Beta 3 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta3)

### 0.12.0-beta2

- Update to 0.12.0 Beta 2 [Release Notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.12.0-beta2)

### 0.11.1

- Update to 0.11.1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.1)

### 0.11.0

- If the upgrade fails with "Invalid build environment, can't build this add-on!". Try uninstalling and reinstalling the addon instead.
- Update to 0.11.0 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0)

### 0.11.0-rc2

- 0.11.0 RC2 [Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-rc2)

### 0.11.0-rc1

- 0.11.0 RC1 [Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-rc1)
- Fix "Send to Frigate+" for addon users

### 0.11.0-beta7

- 0.11.0 Beta 7 [Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-beta7)

### 0.11.0-beta6

- 0.11.0 Beta 6 [Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-beta6)

### 0.11.0-beta5

- 0.11.0 Beta 5 [Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-beta5)
- Added optional config to set Frigate+ API Key

### 0.11.0-beta4

- 0.11.0 Beta 4 [Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-beta4)

### 0.11.0-beta3

- 0.11.0 Beta 3 [Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-beta3)

### 0.11.0-beta2

- 0.11.0 Beta 2 [Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-beta2)

### 0.11.0-beta1

- Special early release to fix hardware acceleration for Raspberry Pi 64bit users.

[Release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.11.0-beta1)

### 3.8

- 0.10.0 Release Candidate 1 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-rc1)

### 3.7

- 0.10.0 Beta 12 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-beta12)

### 3.6

- 0.10.0 Beta 11 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-beta11)

### 3.5

- 0.10.0 Beta 10 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-beta10)

### 3.4

- 0.10.0 Beta 9 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-beta9)

### 3.3

- 0.10.0 Beta 8 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-beta8)

### 3.2

- 0.10.0 Beta 6 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-beta6)

### 3.1

- 0.10.0 Beta 5 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-beta5)

### 3.0

- 0.10.0 Beta 4 [release notes](https://github.com/blakeblackshear/frigate/releases/tag/v0.10.0-beta4)

### 2.5

- 0.9.0 Release Candidate 6

### 2.4

- 0.9.0 Release Candidate 5

### 2.3

- 0.9.0 Release Candidate 4

### 2.2

- 0.9.0 Release Candidate 3
- Allow access to side panel for non-admins

### 2.1

- 0.9.0 Release Candidate 2

### 2.0

- 0.9.0 Release Candidate 1

### 1.8

- 0.8.0 Release Candidate 6

### 1.7

- 0.8.0 Release Candidate 5

### 1.6

- 0.8.0 Release Candidate 4

### 1.5

- 0.8.0 Release Candidate 3

### 1.4

- 0.8.0 Release Candidate 2

### 1.3

- 0.8.0 Release Candidate 1

### 1.2

- 0.8.0 Beta 3

### 1.1

- 0.8.0 Beta 2

### 1.0

- 0.8.0 Beta 1
