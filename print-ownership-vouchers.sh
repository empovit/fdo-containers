#!/bin/sh

dir=ownership_vouchers

for f in $dir/*
do
    filename=${f##$dir/}
    echo "=== OV: ${filename} ==="
    podman run -ti --rm \
        -v $PWD/ownership_vouchers:/etc/fdo/ownership_vouchers:Z \
        localhost/fdo-owner-cli:latest dump-ownership-voucher /etc/fdo/ownership_vouchers/${filename}
done