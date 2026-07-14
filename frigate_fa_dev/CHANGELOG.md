### 81b53b7-aac1

- Builds from `ghcr.io/blakeblackshear/frigate:81b53b7` and replaces embedded go2rtc with [JoeyGE0/go2rtc `isapi-aac-ea0238a`](https://github.com/JoeyGE0/go2rtc/releases/tag/isapi-aac-ea0238a)
- Adds Hikvision ISAPI **AAC** two-way talk (length-prefixed ADTS + ffmpeg PCMU→AAC)
- Branch: `go2rtc-aac-isapi` (not auto-synced from Frigate upstream)

#### Test notes

1. Install/update this add-on from the `go2rtc-aac-isapi` branch of JoeyGE0/frigate-hass-addons (Supervisor builds locally — first install is slower).
2. Add `isapi://user:pass@cam-ip:80/` under each go2rtc stream you want talk on.
3. Leave camera TwoWayAudio on AAC. Confirm go2rtc log shows custom binary / talk works from Live → mic.

