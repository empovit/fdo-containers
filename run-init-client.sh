#!/bin/sh

mkdir -p device_credentials

address=${MANUFACTURING_ADDRESS:-'http://127.0.0.1:8080'}

podman run -ti --rm --privileged --net host \
    --name fdo-manufacturing-client \
    -v $PWD/device_credentials:/root/creds \
    -e DIUN_PUB_KEY_INSECURE=true \
    -e MANUFACTURING_SERVER_URL=${address} \
    localhost/fdo-init-client:latest