#!/bin/sh

RHEL_VERSION=${RHEL_VERSION:-9.3}

podman run -ti --rm localhost/fdo-admin-cli:rhel${RHEL_VERSION} $*