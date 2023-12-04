#!/bin/sh


mkdir -p device_credentials

RHEL_VERSION=${RHEL_VERSION:-9.3}
IMAGE_REPO=${IMAGE_REPO:-"quay.io/vemporop"}
address=${MANUFACTURING_ADDRESS:-'http://127.0.0.1:8080'}

podman run -ti --rm --privileged --net host \
    --name fdo-manufacturing-client \
    -v $PWD/device_credentials:/root/creds \
    -e DIUN_PUB_KEY_INSECURE=true \
    -e MANUFACTURING_SERVER_URL=${address} \
    ${IMAGE_REPO}/fdo-init-client:rhel${RHEL_VERSION}