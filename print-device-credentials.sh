#!/bin/sh

RHEL_VERSION=${RHEL_VERSION:-9.3}
IMAGE_REPO=${IMAGE_REPO:-"quay.io/vemporop"}

podman run -ti --rm \
    -v $PWD/device_credentials:/root/creds:Z \
    ${IMAGE_REPO}/fdo-owner-cli:rhel${RHEL_VERSION} dump-device-credential /root/creds/device_credentials