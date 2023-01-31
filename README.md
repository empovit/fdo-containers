# Containerized FDO Servers and Clients

This repository allows running FDO servers as containers and interacting with them using clients that run as containers as well, for testing and development.

## Benefits

* Can run on a system that does not have FDO packages, without installing them
* Lightweight
* Quick turnaround when trying, for instance, various configurations
* Any generated files (such as device credentials or OV) are available locally right away, without copying
* Can simulate various parts of the protocol separately, e.g. device "onboarding" without waiting OS installation or device initialization

## Pre-requisites

* Podman installed

There is no need to generate keys and certificates as the repo already includes pre-generated ones for testing and development.