#!/bin/sh

if [[ ! -f device_credentials/device_credentials ]]
then
    echo "Run the initialization client first" >&2
    exit 1
fi

environment=""
if [[ ${EXIT_DELAY} != "" ]]
then
    environment="--env EXIT_DELAY=${EXIT_DELAY}"
fi

RHEL_VERSION=${RHEL_VERSION:-9.3}

podman run -ti --rm --privileged --net host \
    --name fdo-onboarding-client \
    -v $PWD/device_credentials:/root/creds ${environment} \
    localhost/fdo-onboarding-client:rhel${RHEL_VERSION}