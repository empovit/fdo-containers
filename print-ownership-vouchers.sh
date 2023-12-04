#!/bin/sh

RHEL_VERSION=${RHEL_VERSION:-9.3}
IMAGE_REPO=${IMAGE_REPO:-"quay.io/vemporop"}
dir=ownership_vouchers

for f in $dir/*
do
    filename=${f##$dir/}
    echo "=== OV: ${filename} ==="
    podman run -ti --rm \
        -v $PWD/ownership_vouchers:/etc/fdo/ownership_vouchers:Z \
        ${IMAGE_REPO}/fdo-owner-cli:rhel${RHEL_VERSION} dump-ownership-voucher /etc/fdo/ownership_vouchers/${filename}
done