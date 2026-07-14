# Frigate Add-ons (Dev fork)

Unofficial fork of [blakeblackshear/frigate-hass-addons](https://github.com/blakeblackshear/frigate-hass-addons) with a **Frigate (Full Access) Dev** add-on that pulls commit-pinned images from the Frigate `dev` branch.


## Custom go2rtc (ISAPI AAC talk)

**Frigate (Full Access) Dev** on this fork builds from the pinned Frigate image and overlays [JoeyGE0/go2rtc](https://github.com/JoeyGE0/go2rtc) (AAC ISAPI two-way talk). Versions look like `81b53b7-aac1`.

Add `isapi://user:pass@camera-ip:80/` under the matching `go2rtc.streams` entry in Frigate config to use talk.

## Installing

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FJoeyGE0%2Ffrigate-hass-addons)

Or, in Home Assistant, navigate to _Settings_ > _Add-ons_ > _Add-on Store_ > _..._ > _Repositories_ and add:

`https://github.com/JoeyGE0/frigate-hass-addons`

## Add-ons provided by this repository

- [Frigate (Full Access) Dev](frigate_fa_dev/README.md) — dev branch builds (unofficial)
- [Frigate](frigate/README.md)
- [Frigate (Full Access)](frigate_fa/README.md)
- [Frigate (For old x86_64 CPUs)](frigate_oldcpu/README.md)
- [Frigate Beta](frigate_beta/README.md)
- [Frigate (Full Access) Beta](frigate_fa_beta/README.md)
- [Frigate Proxy](frigate_proxy/README.md)

NVR with realtime local object detection for IP cameras
