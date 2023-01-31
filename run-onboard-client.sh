#!/bin/sh

if [[ ! -d device_credentials ]]
then
    echo "Run the initialization client first" >&2
    exit 1
fi

podman run -ti --rm --privileged --net host \
    --name fdo-onboarding-client \
    -v $PWD/device_credentials:/root/creds \
    localhost/fdo-onboarding-client:latest