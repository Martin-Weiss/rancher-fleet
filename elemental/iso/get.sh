#!/bin/bash
wget --no-check-certificate `kubectl get machineregistration -n fleet-default elemental-1-registration -o jsonpath="{.status.registrationURL}"` -O initial-registration.yaml
wget -q https://raw.githubusercontent.com/rancher/elemental/main/.github/elemental-iso-add-registration && chmod +x elemental-iso-add-registration
sed -i 's/docker/podman/g' elemental-iso-add-registration
./elemental-iso-add-registration initial-registration.yaml
wget -q https://raw.githubusercontent.com/rancher/elemental/main/.github/elemental-iso-build && chmod +x elemental-iso-build
sed -i 's/docker/podman/g' elemental-iso-build
