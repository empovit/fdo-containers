#!/bin/sh

modules=org.fedoraiot.diskencryption-clevis,org.fedoraiot.sshkey,org.fedoraiot.binaryfile,org.fedoraiot.command,devmod
dir=ownership_vouchers

for f in $dir/*
do
    guid=${f##$dir/}
    echo "GUID: $guid"
    curl -f -s -X GET -H "Authorization: Bearer ExampleAuthToken" \
        "http://127.0.0.1:8083/device_info?serviceinfo_api_version=1&modules=${modules}&device_guid=${guid}" | jq .
done