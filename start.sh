#!/bin/sh

echo "Starting containers..."

set -e

add_args=""

mkdir -p ownership_vouchers
mkdir -p service_files

podman run ${add_args} --privileged -d -p 8080:8080 \
    -v $PWD/manufacturing:/etc/fdo/manufacturing-server.conf.d:Z \
    -v $PWD/keys:/etc/fdo/keys:Z \
    -v $PWD/ownership_vouchers:/etc/fdo/ownership_vouchers \
    --name fdo-manufacturing \
    quay.io/vemporop/fdo-manufacturing-server:1.0

podman run ${add_args} -d -p 8082:8082 \
    -v $PWD/rendezvous:/etc/fdo/rendezvous-server.conf.d:Z \
    -v $PWD/keys:/etc/fdo/keys:Z \
    --name fdo-rendezvous \
    quay.io/vemporop/fdo-rendezvous-server:1.0

podman run ${add_args} -d -p 8081:8081 \
    -v $PWD/owner-onboarding:/etc/fdo/owner-onboarding-server.conf.d:Z \
    -v $PWD/keys:/etc/fdo/keys:Z \
    -v $PWD/ownership_vouchers:/etc/fdo/ownership_vouchers:Z \
    --name fdo-owner-onboarding \
    quay.io/vemporop/fdo-owner-onboarding-server:1.0

podman run ${add_args} -d -p 8083:8083 \
    -v $PWD/serviceinfo-api:/etc/fdo/serviceinfo-api-server.conf.d:Z\
    -v $PWD/keys:/etc/fdo/keys:Z \
    -v $PWD/service_files:/etc/fdo/files:Z \
    --name fdo-serviceinfo-api \
    quay.io/vemporop/fdo-serviceinfo-api-server:1.0