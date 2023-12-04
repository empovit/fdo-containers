#!/bin/sh

echo "Starting containers..."

set -e

RHEL_VERSION=${RHEL_VERSION:-9.3}
IMAGE_REPO=${IMAGE_REPO:-"quay.io/vemporop"}
add_args=""

mkdir -p ownership_vouchers
mkdir -p service_files


podman run ${add_args} --privileged -d --net host \
    -v $PWD/manufacturing:/etc/fdo/manufacturing-server.conf.d:Z \
    -v $PWD/keys:/etc/fdo/keys:Z \
    -v $PWD/ownership_vouchers:/etc/fdo/ownership_vouchers \
    --name fdo-manufacturing \
   ${IMAGE_REPO}/fdo-manufacturing-server:rhel${RHEL_VERSION}

podman run ${add_args} -d --net host \
    -v $PWD/rendezvous:/etc/fdo/rendezvous-server.conf.d:Z \
    -v $PWD/keys:/etc/fdo/keys:Z \
    --name fdo-rendezvous \
    ${IMAGE_REPO}/fdo-rendezvous-server:rhel${RHEL_VERSION}

podman run ${add_args} -d --net host \
    -v $PWD/owner-onboarding:/etc/fdo/owner-onboarding-server.conf.d:Z \
    -v $PWD/keys:/etc/fdo/keys:Z \
    -v $PWD/ownership_vouchers:/etc/fdo/ownership_vouchers:Z \
    --name fdo-owner-onboarding \
    ${IMAGE_REPO}/fdo-owner-onboarding-server:rhel${RHEL_VERSION}

podman run ${add_args} -d --net host \
    -v $PWD/serviceinfo-api:/etc/fdo/serviceinfo-api-server.conf.d:Z\
    -v $PWD/keys:/etc/fdo/keys:Z \
    -v $PWD/service_files:/etc/fdo/files:Z \
    --name fdo-serviceinfo-api \
    ${IMAGE_REPO}/fdo-serviceinfo-api-server:rhel${RHEL_VERSION}