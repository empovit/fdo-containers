# Containerized FDO Servers and Clients

This repository allows to run FDO servers as containers and interact with them using clients that run as containers as well, for testing and development.

## Important

* First, build the container images by running [./build-images.sh](./build-images.sh).
* You will need to run the device initialization client ([./run-init-client.sh](./run-init-client.sh)) at least once to create a device credentials file under _device\_credentials_ and an ownership voucher under _ownership\_vouchers_.
* You will need to wait for the owner-onboarding server to send ownership vouchers to the rendezvous server before a successful "onboarding".
* Keep in mind that creating a user and many other service-info commands will fail because of the limitation of a container.
* There is no need to generate keys and certificates as the repo already includes pre-generated ones for testing and development.

## Benefits

* Can run on a system that does not have FDO packages, without installing them.
* Lightweight.
* Quick turnaround when trying, for instance, various configurations.
* Any generated files (such as device credentials or OV) are available locally right away, without copying.
* Can simulate various parts of the protocol separately, e.g. device "onboarding" without waiting OS installation or device initialization.
