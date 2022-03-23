#!/bin/bash

# change to this directory
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

echo "$(date +'%Y-%m-%d %H:%M:%S')  k3d-setup start" >> /home/akdc/status

# fail if k3d.yaml isn't present
if [ ! -f ./k3d.yaml ]
then
  echo "failed (k3d.yaml not found)"
  exit 1
fi

# this will fail harmlessly if a cluster doesn't exist
k3d cluster delete

# create the cluster (run as akdc)
k3d cluster create --registry-use k3d-registry.localhost:5500 --config k3d.yaml

# sleep to avoid timing issues
sleep 5
kubectl wait pod -l k8s-app=kube-dns -n kube-system --for condition=ready --timeout 30s

# setup Dapr and Radius
if [ "$AKDC_DAPR" = "true" ]
then
  echo "$(date +'%Y-%m-%d %H:%M:%S')  installing dapr" >> status
  wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash
  dapr init -k --enable-mtls=false --wait

  echo "$(date +'%Y-%m-%d %H:%M:%S')  installing radius" >> status
  wget -q "https://get.radapp.dev/tools/rad/install.sh" -O - | /bin/bash
  rad env init kubernetes -n radius-system
fi

echo "$(date +'%Y-%m-%d %H:%M:%S')  k3d-setup complete" >> /home/akdc/status
