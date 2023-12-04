#!/bin/sh

RHEL_VERSION=${RHEL_VERSION:-9.3}
prefix="images/Containerfile."

for f in images/Containerfile.*
do
    name=${f##$prefix}
    podman build \
        --secret id=rhsm_org,src=${RHSM_ORG_FILE} \
        --secret id=rhsm_activationkey,src=${RHSM_ACTIVATIONKEY_FILE} \
        --build-arg RHEL_VERSION=${RHEL_VERSION} \
        -t "fdo-${name}:rhel${RHEL_VERSION}" -f $f images/
done