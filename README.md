# Retail Edge Demo

> These are the clusters we use for the Retail Edge Demo
> They generate data for our dashboards
>
> Do not run these scripts without talking to Anne or Bart first

- Create the Retail Edge Demo (red) Fleet

- Once the VMs are setup, it's easier to reset the k3d cluster on the VM than rebuild the VM
  - From an ssh shell into the VM
    - `kic reset`

## Setup

> From GitHub Codespaces

## Login to Azure

```bash

az login --use-device-code

```

## CD to this directory

```bash

cd red-fleet

```

## Create the clusters

> Note: you have to intentionally edit the create script for it to work

```bash

./create.sh

```

## Check Setup

- Run until `complete` is the status for each server

```bash

# check all clusters
flt check setup

```

## Check Flux Setup

```bash

# check all clusters
flt check flux

```

## Check DNS

```bash

# run curl to each cluster
./curl-all.sh

```

## Delete the Clusters

> Note: you have to intentionally edit the delete script for it to work

```bash

./delete.sh

```

## Check clusters are deleted

```bash

flt groups

```
