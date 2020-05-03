#!/bin/sh
REPO=docker.pkg.github.com/ericm/healscript/healscript
docker run --rm --privileged multiarch/qemu-user-static:register --reset


echo "Building x86_64"
docker build --build-arg -t ${REPO}:latest -t ${REPO}:x86_64 .
docker push ${REPO}:latest
docker push ${REPO}:x86_64


echo "Building armhf"
docker build --build-arg arch=armhf -t ${REPO}:armhf .
docker push ${REPO}:armhf
