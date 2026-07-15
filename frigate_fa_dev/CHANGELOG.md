### 81b53b7-aac2

- go2rtc overlay → [isapi-aac-cc5bb61](https://github.com/JoeyGE0/go2rtc/releases/tag/isapi-aac-cc5bb61): fix PCMU→AAC by finding Frigate `ffmpeg` path (talk matched but no speaker audio)

### 81b53b7-aac1

- **Custom go2rtc:** builds from Frigate `81b53b7` and replaces embedded go2rtc with [JoeyGE0/go2rtc `isapi-aac-ea0238a`](https://github.com/JoeyGE0/go2rtc/releases/tag/isapi-aac-ea0238a) (Hikvision ISAPI AAC talk)
- Normal Dev add-on updates from this repo (`main`) now use the AAC build — add `isapi://` under go2rtc streams to test talk

### 81b53b7

- Track Frigate dev branch commit [81b53b7](https://github.com/blakeblackshear/frigate/commit/81b53b78356577ef6f5b075123aebfdf2e1f8ffb)

- GHCR image `ghcr.io/blakeblackshear/frigate:81b53b7` is available

#### Changes (1 commit(s))

- Miscellaneous fixes (0.18 beta) (#23716) ([81b53b7](https://github.com/blakeblackshear/frigate/commit/81b53b78356577ef6f5b075123aebfdf2e1f8ffb))

### c2e739b

- Track Frigate dev branch commit [c2e739b](https://github.com/blakeblackshear/frigate/commit/c2e739b4bc75d848efaa7cb34c604f54282d3a8a)

- GHCR image `ghcr.io/blakeblackshear/frigate:c2e739b` is available

#### Changes (2 commit(s))

- Add logout endpoint to Nginx configuration to prevent a new token on logout (#23678) ([62d4e87](https://github.com/blakeblackshear/frigate/commit/62d4e87e5d9b580c88790f18c1babf2017d31fb7))
- bound REGEXP evaluation with a timeout to prevent ReDoS on the database thread (#23714) ([c2e739b](https://github.com/blakeblackshear/frigate/commit/c2e739b4bc75d848efaa7cb34c604f54282d3a8a))

### 775ce22

- Track Frigate dev branch commit [775ce22](https://github.com/blakeblackshear/frigate/commit/775ce22204655b1eb77837d08b0e4ba7fd98f031)

- GHCR image `ghcr.io/blakeblackshear/frigate:775ce22` is available

#### Changes (1 commit(s))

- Miscellaneous Fixes (#23709) ([775ce22](https://github.com/blakeblackshear/frigate/commit/775ce22204655b1eb77837d08b0e4ba7fd98f031))

### 6f24f5a

- Track Frigate dev branch commit [6f24f5a](https://github.com/blakeblackshear/frigate/commit/6f24f5a595e61541d129f114eb30b244c6563d82)

- GHCR image `ghcr.io/blakeblackshear/frigate:6f24f5a` is available

#### Changes (1 commit(s))

- Convert face crops to RGB before embedding (#23712) ([6f24f5a](https://github.com/blakeblackshear/frigate/commit/6f24f5a595e61541d129f114eb30b244c6563d82))

### 65af0b1

- Track Frigate dev branch commit [65af0b1](https://github.com/blakeblackshear/frigate/commit/65af0b1351e3889c802cc65ba725d7187c72e622)

- GHCR image `ghcr.io/blakeblackshear/frigate:65af0b1` is available

#### Changes (2 commit(s))

- UI improvements and fixes (#23690) ([fcd05ec](https://github.com/blakeblackshear/frigate/commit/fcd05ec7bc5c9425e7d69c314d8d50feb6b494e1))
- GenAI Fixes (#23708) ([65af0b1](https://github.com/blakeblackshear/frigate/commit/65af0b1351e3889c802cc65ba725d7187c72e622))

### 5f6043a

- Track Frigate dev branch commit [5f6043a](https://github.com/blakeblackshear/frigate/commit/5f6043aa92ae9033203c415a762aed02de3b26c3)

- GHCR image `ghcr.io/blakeblackshear/frigate:5f6043a` is available

#### Changes (1 commit(s))

- Fix enabled flag for custom classification models (#23681) ([5f6043a](https://github.com/blakeblackshear/frigate/commit/5f6043aa92ae9033203c415a762aed02de3b26c3))

### da4037e

- Track Frigate dev branch commit [da4037e](https://github.com/blakeblackshear/frigate/commit/da4037eb52ef81676ef8eaa8867480330bbe93bb)

- GHCR image `ghcr.io/blakeblackshear/frigate:da4037e` is available

#### Changes (1 commit(s))

- UI tweaks (#23679) ([da4037e](https://github.com/blakeblackshear/frigate/commit/da4037eb52ef81676ef8eaa8867480330bbe93bb))

### f3c09ae

- Track Frigate dev branch commit [f3c09ae](https://github.com/blakeblackshear/frigate/commit/f3c09ae169473d34cacfc747d4218e037261c51a)

- GHCR image `ghcr.io/blakeblackshear/frigate:f3c09ae` is available

#### Changes (2 commit(s))

- Miscellaneous fixes (#23661) ([f6596ac](https://github.com/blakeblackshear/frigate/commit/f6596ac7b0a75541631c127289195c139f84df96))
- Typo fixes (#23669) ([f3c09ae](https://github.com/blakeblackshear/frigate/commit/f3c09ae169473d34cacfc747d4218e037261c51a))

### 20c2be4

- Track Frigate dev branch commit [20c2be4](https://github.com/blakeblackshear/frigate/commit/20c2be43686ac559b6634802780acecbd82f564a)

- GHCR image `ghcr.io/blakeblackshear/frigate:20c2be4` is not published yet; the add-on may not install until Frigate builds it

#### Changes (36 commit(s))

- Miscellaneous fixes (#23619) ([729ee86](https://github.com/blakeblackshear/frigate/commit/729ee860431d1d2236c4a1802067705884e36ebb))
- fix config corruption when deleting the last commented mask or zone (#23627) ([1c745e0](https://github.com/blakeblackshear/frigate/commit/1c745e08470d45af50d6476e680daecfee457499))
- Register per-camera notifications MQTT callbacks (#23637) ([a26487c](https://github.com/blakeblackshear/frigate/commit/a26487c4f0924b6a2f7cb20b8a969b564876aa36))
- Translated using Weblate (Turkish) ([9662bf0](https://github.com/blakeblackshear/frigate/commit/9662bf094f833a72cc0c72aeaf3d9e0c31d65794))
- Translated using Weblate (Portuguese (Brazil)) ([7726d2e](https://github.com/blakeblackshear/frigate/commit/7726d2ec97aa351978634f374509aeea61fd9f40))
- Translated using Weblate (German) ([b0cecd5](https://github.com/blakeblackshear/frigate/commit/b0cecd534bdafa307c8e1c6c9168f4711ba3801e))
- Translated using Weblate (Danish) ([f853875](https://github.com/blakeblackshear/frigate/commit/f85387570b07cd681871e8861f29e78c6685e570))
- Translated using Weblate (Greek) ([126cbd9](https://github.com/blakeblackshear/frigate/commit/126cbd9e5e56bc0dc2b7761206d5c644f8e59ab8))
- Translated using Weblate (Russian) ([f590256](https://github.com/blakeblackshear/frigate/commit/f59025681d2deab443141a0ed30f8569107ae5cb))
- Translated using Weblate (Romanian) ([a9e4cd0](https://github.com/blakeblackshear/frigate/commit/a9e4cd061c55032e64c4212ba129f35c67c346d5))
- Translated using Weblate (Bulgarian) ([3ae70f1](https://github.com/blakeblackshear/frigate/commit/3ae70f1808b172b2a4298b7486f4d3a4c47d3ed8))
- Translated using Weblate (Ukrainian) ([39856aa](https://github.com/blakeblackshear/frigate/commit/39856aaa2dfff4f394f512d25f4af46a765361c5))
- Translated using Weblate (Catalan) ([f5d6ca2](https://github.com/blakeblackshear/frigate/commit/f5d6ca2772ab460dfe6385749237767b905a312d))
- Translated using Weblate (Portuguese) ([5e17aa6](https://github.com/blakeblackshear/frigate/commit/5e17aa685b60a18658ab3a22ac4156eb699f61d4))
- Translated using Weblate (Hungarian) ([79fcf40](https://github.com/blakeblackshear/frigate/commit/79fcf40d96eb40ce1065d7974fe10ad13133b5bd))
- Translated using Weblate (Hebrew) ([ca1637b](https://github.com/blakeblackshear/frigate/commit/ca1637ba5acac1a27b970ecdc180f4f452b86b47))
- Translated using Weblate (Polish) ([645601d](https://github.com/blakeblackshear/frigate/commit/645601d83ed4d3657bb3aebb8da9b89888e1bbc2))
- Translated using Weblate (Italian) ([723bfa9](https://github.com/blakeblackshear/frigate/commit/723bfa9308c7f832dbff2da57ec65bcbd3c79aa1))
- Translated using Weblate (Arabic) ([c5f77b3](https://github.com/blakeblackshear/frigate/commit/c5f77b3e203089cc8b3d26d6328b27a8a61819f7))
- Translated using Weblate (Indonesian) ([2819e76](https://github.com/blakeblackshear/frigate/commit/2819e76491561d195cd41a3e7f6aa296f18fdfae))
- Translated using Weblate (Dutch) ([87f9c62](https://github.com/blakeblackshear/frigate/commit/87f9c6240a890ac0b2430148f958806a726972a1))
- Translated using Weblate (Spanish) ([da20b13](https://github.com/blakeblackshear/frigate/commit/da20b134d27d488a7d2c385b50c50158ac363be1))
- Translated using Weblate (French) ([3c3acbe](https://github.com/blakeblackshear/frigate/commit/3c3acbe8f83186914d48de11dc394185fa8f1dd7))
- Translated using Weblate (Swedish) ([075e519](https://github.com/blakeblackshear/frigate/commit/075e5196a71d8241d16a6e7dff05437f5c1c8432))
- Translated using Weblate (Serbian) ([1c610a7](https://github.com/blakeblackshear/frigate/commit/1c610a72717baa7be23e7fc415b99e97b10bcb67))
- Translated using Weblate (Slovak) ([9f52372](https://github.com/blakeblackshear/frigate/commit/9f52372cfdd2dd2ee193c5d6dac4f4154e9cb3dc))
- Translated using Weblate (Chinese (Traditional Han script)) ([75ca666](https://github.com/blakeblackshear/frigate/commit/75ca66679a622d9c55fd68b6d0c5cfbcdda48807))
- Translated using Weblate (Chinese (Simplified Han script)) ([c4b0076](https://github.com/blakeblackshear/frigate/commit/c4b007686fa8ab8cb64e4ef8a2dcf7903203f593))
- Translated using Weblate (Norwegian Bokmål) ([4e65cc1](https://github.com/blakeblackshear/frigate/commit/4e65cc10197e1e14cd75450715507cfb4f9d989e))
- docs: add Frigate Notify Alert to third party extensions (#23634) ([279dcf9](https://github.com/blakeblackshear/frigate/commit/279dcf9bca405c075a14047729facad7be4c1b9b))
- Tweaks (#23638) ([455b868](https://github.com/blakeblackshear/frigate/commit/455b8687e8674b49410ce36d3e05ca6366671b7c))
- Increase ruff coverage (#23644) ([4ee12e6](https://github.com/blakeblackshear/frigate/commit/4ee12e62373531ff9772c38f85fb74158acde025))
- Miscellaneous fixes (#23648) ([c99d6b0](https://github.com/blakeblackshear/frigate/commit/c99d6b0dcfa354369ff10b7be87cf601e9251b40))
- Miscellaneous fixes (#23651) ([e6cac50](https://github.com/blakeblackshear/frigate/commit/e6cac50250530ed8ecb4788c1a23ed384e7a1d5b))
- bump go2rtc to 1.9.14 (#23657) ([8b72c7a](https://github.com/blakeblackshear/frigate/commit/8b72c7aa1fb531a22e0137192fbb200661f8ee3b))
- Template tweaks (#23659) ([20c2be4](https://github.com/blakeblackshear/frigate/commit/20c2be43686ac559b6634802780acecbd82f564a))

### c007661

- Track Frigate dev branch commit [c007661](https://github.com/blakeblackshear/frigate/commit/c007661a71d307c46bb2f13cbc0e69baa826e15e)

- GHCR image `ghcr.io/blakeblackshear/frigate:c007661` is available
- Revert from hawkeye217 `90761a5` stale-debug build after #23600 log capture

#### Changes (15 commit(s))

- Fixes (#23235) ([0013555](https://github.com/blakeblackshear/frigate/commit/001355552867f1327e4abc0c2377b9eda1312e01))
- Add metadata for creation time to recording segments and exports (#23239) ([26d3130](https://github.com/blakeblackshear/frigate/commit/26d31300e66dda2db6dcd90b84be268dc5e77aef))
- fix admin response cache leak to non-admin users via nginx proxy_cache (#23261) ([06b059c](https://github.com/blakeblackshear/frigate/commit/06b059c36ae3fd8beebd69bafb57fac05891de59))
- Docs update (#23280) ([ef44c18](https://github.com/blakeblackshear/frigate/commit/ef44c18c07999ec649705b5ad1290c91ff40e7be))
- update mask docs for more clarity (#23282) ([9100592](https://github.com/blakeblackshear/frigate/commit/910059281f1cfd5b52f5ee70f63216499bd3e28c))
- filter motion review by allowed cameras (#23294) ([fa07109](https://github.com/blakeblackshear/frigate/commit/fa07109a855b7e4b9d6538f8b7d3cd9424fbf761))
- Add ability to control chapters set on MP4 Export (#23310) ([28e3e1e](https://github.com/blakeblackshear/frigate/commit/28e3e1ec7434d4068da65ae0e1473c415772cc36))
- Chapter tweaks (#23440) ([06e3d0a](https://github.com/blakeblackshear/frigate/commit/06e3d0ac5dcf2f8d156c571c6317f6547dfc3b73))
- Catch edge cases in security protections (#23493) ([b3ce448](https://github.com/blakeblackshear/frigate/commit/b3ce4486b9535491f3498aee339695e77e6a44a4))
- Offload preview encoding and Plus upload off the API event loop (#23552) ([4e5e8e3](https://github.com/blakeblackshear/frigate/commit/4e5e8e3c5934e89f73ba3d9e478e540fdf398ebf))
- resolve the leaked Query default so media Cache-Control max-age is always a valid int (#23553) ([933a7f1](https://github.com/blakeblackshear/frigate/commit/933a7f1a3f00b33667eef4a23d587977bc817fd4))
- allow non-admin users to send PTZ commands for cameras they have access to (#23578) ([3d4dd3a](https://github.com/blakeblackshear/frigate/commit/3d4dd3ac4b00e7257bd3412608a783001d7d77ed))
- Merge remote-tracking branch 'origin/master' into dev ([ea131e1](https://github.com/blakeblackshear/frigate/commit/ea131e1663cb3a658a76236f18d8159ebbcdbef9))
- Miscellaneous fixes (#23610) ([9b02c73](https://github.com/blakeblackshear/frigate/commit/9b02c7318d22ed4213a29e3f134e117c2497f360))
- Enhancements (#23611) ([c007661](https://github.com/blakeblackshear/frigate/commit/c007661a71d307c46bb2f13cbc0e69baa826e15e))

### 90761a5

- Temporary debug build for [stale live-view overlays #23600](https://github.com/blakeblackshear/frigate/discussions/23600)
- Image: `ghcr.io/hawkeye217/frigate:90761a5` (hawkeye217 stale-debug logging)
- Revert to `ghcr.io/blakeblackshear/frigate` dev when done testing

### e2ce0c8

- Track Frigate dev branch commit [e2ce0c8](https://github.com/blakeblackshear/frigate/commit/e2ce0c82ff1c7e3626e705d36c4add85ec89939f)

- GHCR image `ghcr.io/blakeblackshear/frigate:e2ce0c8` is available

#### Changes (1 commit(s))

- show Frigate+ submission failures in the UI instead of showing a false success (#23579) ([e2ce0c8](https://github.com/blakeblackshear/frigate/commit/e2ce0c82ff1c7e3626e705d36c4add85ec89939f))

### 1ec511b

- Track Frigate dev branch commit [1ec511b](https://github.com/blakeblackshear/frigate/commit/1ec511b66cae745bc22c09f481475947ba9c5085)

- GHCR image `ghcr.io/blakeblackshear/frigate:1ec511b` is available

#### Changes (2 commit(s))

- Rebuild object docs (#23570) ([accbab7](https://github.com/blakeblackshear/frigate/commit/accbab7afce342c6daed884659ccbb48d0cd5f98))
- Docs tweaks (#23572) ([1ec511b](https://github.com/blakeblackshear/frigate/commit/1ec511b66cae745bc22c09f481475947ba9c5085))

### cbf6d03

- Track Frigate dev branch commit [cbf6d03](https://github.com/blakeblackshear/frigate/commit/cbf6d032cb6c93d614976c5d5a18701b127a6668)

- GHCR image `ghcr.io/blakeblackshear/frigate:cbf6d03` is available

#### Changes (1 commit(s))

- Add optional docs link to config field messages (#23569) ([cbf6d03](https://github.com/blakeblackshear/frigate/commit/cbf6d032cb6c93d614976c5d5a18701b127a6668))

### ec3fb00

- Track Frigate dev branch commit [ec3fb00](https://github.com/blakeblackshear/frigate/commit/ec3fb00494d3fa17231068002b56def82cf95530)

- GHCR image `ghcr.io/blakeblackshear/frigate:ec3fb00` is available

#### Changes (3 commit(s))

- perf(util): cut redundant work in per-frame detection consolidation (#23522) ([a2b46f5](https://github.com/blakeblackshear/frigate/commit/a2b46f5d84fcc97dbc45c347a27ace55ff178e35))
- perf(track): avoid per-frame allocations and list lookups in tracker (#23523) ([081d6f9](https://github.com/blakeblackshear/frigate/commit/081d6f95ef4ac7257a051a0ab9f263d8e212ddf1))
- perf(track): use sum()/len() instead of np.mean in average_boxes (#23521) ([ec3fb00](https://github.com/blakeblackshear/frigate/commit/ec3fb00494d3fa17231068002b56def82cf95530))

### f065cc8

- Track Frigate dev branch commit [f065cc8](https://github.com/blakeblackshear/frigate/commit/f065cc8642ed35fb47bf3d1602811d922a8ec4ec)

- GHCR image `ghcr.io/blakeblackshear/frigate:f065cc8` is available

#### Changes (3 commit(s))

- docs: correct face_recognition min_area default to 750 (#23535) ([bb5056a](https://github.com/blakeblackshear/frigate/commit/bb5056a68af5b68633c2b1f7bdac25beeb425841))
- Improve storage docs (#23542) ([9ce80e7](https://github.com/blakeblackshear/frigate/commit/9ce80e7266899e470e9d5f5e177ab37bbbfab619))
- fix unbounded recordings_info growth for cameras with no cache segments (#23528) ([f065cc8](https://github.com/blakeblackshear/frigate/commit/f065cc8642ed35fb47bf3d1602811d922a8ec4ec))

### d982b3a

- Track Frigate dev branch commit [d982b3a](https://github.com/blakeblackshear/frigate/commit/d982b3a782608bbf805cb2e2b45b27ba6bf6c318)

- GHCR image `ghcr.io/blakeblackshear/frigate:d982b3a` is available

#### Changes (1 commit(s))

- perf(util): use monotonic clock and bounded deque in EventsPerSecond (#23520) ([d982b3a](https://github.com/blakeblackshear/frigate/commit/d982b3a782608bbf805cb2e2b45b27ba6bf6c318))

### d036061

- Track Frigate dev branch commit [d036061](https://github.com/blakeblackshear/frigate/commit/d036061e3f6b96b9adf6e4cf60b6ebc723395c11)

- GHCR image `ghcr.io/blakeblackshear/frigate:d036061` is available

#### Changes (1 commit(s))

- cache the preview_frames directory listing so concurrent per-camera frame requests share one scan instead of each re-listing the whole directory (#23526) ([d036061](https://github.com/blakeblackshear/frigate/commit/d036061e3f6b96b9adf6e4cf60b6ebc723395c11))

### 5003ab8

- Track Frigate dev branch commit [5003ab8](https://github.com/blakeblackshear/frigate/commit/5003ab895c9802bc5c292da665eab7132b7f5eba)

- GHCR image `ghcr.io/blakeblackshear/frigate:5003ab8` is available

#### Changes (2 commit(s))

- Miscellaneous fixes (#23513) ([652ea24](https://github.com/blakeblackshear/frigate/commit/652ea2454f17682cf2e1bc404b40ba23ccf0f3cd))
- add camera search, select-all/clear, and group selection to the multi-camera export dialog (#23516) ([5003ab8](https://github.com/blakeblackshear/frigate/commit/5003ab895c9802bc5c292da665eab7132b7f5eba))

### 37ea6b4

- Track Frigate dev branch commit [37ea6b4](https://github.com/blakeblackshear/frigate/commit/37ea6b46b51e459a51f25f29fead2797e0fa04a4)

- GHCR image `ghcr.io/blakeblackshear/frigate:37ea6b4` is not published yet; the add-on may not install until Frigate builds it

#### Changes (1 commit(s))

- small docs tweaks (#23506) ([37ea6b4](https://github.com/blakeblackshear/frigate/commit/37ea6b46b51e459a51f25f29fead2797e0fa04a4))

### 8203e39

- Track Frigate dev branch commit [8203e39](https://github.com/blakeblackshear/frigate/commit/8203e39b7f3408e348e84d717b98bf6f9b40f6d9)

### e84a89e

- Track Frigate dev branch commit [e84a89e](https://github.com/blakeblackshear/frigate/commit/e84a89e)
