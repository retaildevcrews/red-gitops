#!/bin/bash

# this runs before arc-setup.sh
# this does not run if akdc create --debug is used

# runs as akdc user
# env variables defined in .bashrc
    # AKDC_CLUSTER
    # AKDC_REPO
    # AKDC_FQDN
    # AKDC_DEBUG

# change to this directory
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

echo "$(date +'%Y-%m-%d %H:%M:%S')  akdc-pre-arc start" >> /home/akdc/status


echo "$(date +'%Y-%m-%d %H:%M:%S')  akdc-pre-arc complete" >> /home/akdc/status
