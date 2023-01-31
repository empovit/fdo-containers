#!/bin/sh

podman run -ti --rm \
    -v $PWD/device_credentials:/root/creds:Z \
    localhost/fdo-owner-cli:latest dump-device-credential /root/creds/device_credentials