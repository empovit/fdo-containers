#!/bin/sh

mkdir -p device_credentials

podman run -ti --rm --privileged \
    --name fdo-manufacturing-client \
    -v $PWD/device_credentials:/root/creds \
    -e DIUN_PUB_KEY_INSECURE=true \
    -e MANUFACTURING_SERVER_URL=http://fdo-local-setup:8080 \
    fdo-init-client:latest