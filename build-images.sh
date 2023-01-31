#!/bin/sh

prefix="images/Containerfile."

for f in images/Containerfile.*
do
    name=${f##$prefix}
    podman build -t "fdo-${name}:latest" -f $f images/
done