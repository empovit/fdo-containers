#!/bin/sh

set -e

RHEL_VERSION=${RHEL_VERSION:-9.3}
IMAGE_REPO=${IMAGE_REPO:-"quay.io/vemporop"}
FDO_KEYS_DIR=${FDO_KEYS_DIR:-"${PWD}/keys"}
FDO_CERT_ORG=${FDO_CERT_ORG:-"Example.com"}
FDO_CERT_COUNTRY=${FDO_CERT_COUNTRY:-"US"}

ADMIN_CLI_IMG=${IMAGE_REPO}/fdo-admin-cli:rhel${RHEL_VERSION}

mkdir -p "${FDO_KEYS_DIR}"

for subj in diun manufacturer device-ca owner
do
    podman run --privileged --rm -ti -v "${FDO_KEYS_DIR}":/etc/fdo/keys:rw \
        "${ADMIN_CLI_IMG}" \
		generate-key-and-cert \
        --organization "${FDO_CERT_ORG}" \
        --country "${FDO_CERT_COUNTRY}" \
        --destination-dir /etc/fdo/keys ${subj}
done
