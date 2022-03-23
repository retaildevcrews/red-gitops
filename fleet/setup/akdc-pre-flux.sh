#!/bin/bash

# this runs before flux-setup.sh
# this does not run if akdc create --debug is used

# runs as akdc user
# env variables defined in .bashrc
    # AKDC_CLUSTER
    # AKDC_REPO
    # AKDC_FQDN
    # AKDC_DEBUG

# change to this directory
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

echo "$(date +'%Y-%m-%d %H:%M:%S')  akdc-pre-flux start" >> /home/akdc/status

# change ownership
sudo chown -R "$USER:$USER" /home/akdc
chmod 600 /home/akdc/.ssh/akdc.pat

sudo chown -R "$USER:$USER" /home/akdc

if [ "$AKDC_DEBUG" != "true" ]
then
    # create the tls secret
    # this has to be installed before flux
    if [ -f /home/akdc/.ssh/certs.pem ]
    then
        kubectl create secret tls ssl-cert --cert /home/akdc/.ssh/certs.pem --key /home/akdc/.ssh/certs.key
    fi

    # create admin service account
    kubectl create serviceaccount admin-user
    kubectl create clusterrolebinding admin-user-binding --clusterrole cluster-admin --serviceaccount default:admin-user

    if [ -d ./bootstrap ]
    then
        kubectl apply -f ./bootstrap
        kubectl apply -R -f ./bootstrap

        if [ -f /home/akdc/.ssh/fluent-bit.key ]
        then
            kubectl create secret generic fluent-bit-secrets -n fluent-bit --from-file /home/akdc/.ssh/fluent-bit.key
        fi

        if [ -f /home/akdc/.ssh/prometheus.key ]
        then
            kubectl create secret -n prometheus generic prom-secrets --from-file /home/akdc/.ssh/prometheus.key
        fi
    fi
fi

echo "$(date +'%Y-%m-%d %H:%M:%S')  akdc-pre-flux complete" >> /home/akdc/status
