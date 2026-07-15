# Overlay JoeyGE0 go2rtc (ISAPI AAC talk) onto official Frigate image.
ARG BUILD_FROM
FROM ${BUILD_FROM}

# BuildKit / HA set TARGETARCH to amd64 or arm64 (matches go2rtc asset names).
ARG TARGETARCH
ARG GO2RTC_TAG=isapi-aac-0644543

ADD --chmod=755 \
  "https://github.com/JoeyGE0/go2rtc/releases/download/${GO2RTC_TAG}/go2rtc_linux_${TARGETARCH}" \
  /usr/local/go2rtc/bin/go2rtc
