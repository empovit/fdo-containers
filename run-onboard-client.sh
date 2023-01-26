#!/bin/sh

if [[ ! -d device_credentials ]]
then
    echo "First run the initialization client" >&2
    exit 1
fi

podman run -ti --rm --privileged -v $PWD/device_credentials:/root/creds fdo-onboarding-client:latest