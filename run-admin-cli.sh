#!/bin/sh

RHEL_VERSION=${RHEL_VERSION:-9.3}
IMAGE_REPO=${IMAGE_REPO:-"quay.io/vemporop"}

podman run -ti --rm ${IMAGE_REPO}/fdo-admin-cli:rhel${RHEL_VERSION} $*