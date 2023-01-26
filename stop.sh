#!/bin/sh

echo "Stopping and removing containers..."

for s in manufacturing owner-onboarding serviceinfo-api rendezvous manufacturing-client onboarding-client
do
    podman stop fdo-${s} -i
    podman rm fdo-${s} -i
done