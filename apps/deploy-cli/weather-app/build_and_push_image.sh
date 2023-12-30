#!/usr/bin/env bash

IMAGE=quay.io/<USER>/openshift-dev-deploy-cli-weather:1.0    CHANGE_ME

podman build -t ${IMAGE} .

podman push ${IMAGE}
