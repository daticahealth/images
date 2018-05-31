#!/usr/bin/env bash

echo "==> Building image ..."
docker build -t datica/salt-minion .
echo "==> Cleaning up dangling images ..."
docker images --quiet --filter=dangling=true | xargs docker rmi
