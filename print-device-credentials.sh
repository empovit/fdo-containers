#!/bin/sh

RHEL_VERSION=${RHEL_VERSION:-9.3}

podman run -ti --rm \
    -v $PWD/device_credentials:/root/creds:Z \
    localhost/fdo-owner-cli:rhel${RHEL_VERSION} dump-device-credential /root/creds/device_credentials