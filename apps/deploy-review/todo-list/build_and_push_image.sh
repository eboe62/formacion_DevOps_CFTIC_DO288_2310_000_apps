#!/usr/bin/env bash

IMAGE=quay.io/<USER>/openshift-dev-deploy-review-todo-list	CHANGE_ME

podman build -t ${IMAGE} .

podman push ${IMAGE}
