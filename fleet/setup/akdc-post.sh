#!/bin/bash

# this runs after flux-setup.sh
# this does not run if akdc create --debug is used

# runs as akdc user
# env variables defined in .bashrc
    # AKDC_CLUSTER
    # AKDC_REPO
    # AKDC_FQDN
    # AKDC_DEBUG

# change to this directory
#cd "$(dirname "${BASH_SOURCE[0]}")" || exit

echo "$(date +'%Y-%m-%d %H:%M:%S')  akdc-post start" >> /home/akdc/status

# add your post script here
docker pull ghcr.io/cse-labs/webv-red:latest
docker pull ghcr.io/cse-labs/webv-red:beta

kubectl run jumpbox --image=ghcr.io/cse-labs/jumpbox --restart=Always

kubectl get pods -A

echo "$(date +'%Y-%m-%d %H:%M:%S')  akdc-post complete" >> /home/akdc/status
