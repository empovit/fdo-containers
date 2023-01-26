#!/bin/sh

for s in manufacturing owner-onboarding serviceinfo-api rendezvous
do
    podman stop fdo-${s} -i
    podman rm fdo-${s} -i
done