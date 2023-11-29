#!/bin/sh

prefix="images/Containerfile."

for f in images/Containerfile.*
do
    name=${f##$prefix}
    podman build --build-arg RHSM_ACTIVATIONKEY=${RHSM_ACTIVATIONKEY} --build-arg RHSM_ORG=${RHSM_ORG} -t "fdo-${name}:latest" -f $f images/
done