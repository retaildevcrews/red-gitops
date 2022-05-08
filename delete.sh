#!/bin/bash

echo "remove the lock from the red-fleet RG"
echo "edit delete.sh before running"
exit 0

# make sure the env vars are correct
export AKDC_SSL=cseretail.com
export AKDC_DNS_RG=tld
export AKDC_GITOPS=true
export AKDC_BRANCH=$(git branch --show-current)
export AKDC_REPO=retaildevcrews/red-gitops

# this will delete the DNS entries
flt dns delete central-mo-kc-101
flt dns delete central-mo-kc-102
flt dns delete central-tx-austin-101
flt dns delete central-tx-austin-102
flt dns delete east-ga-atlanta-101
flt dns delete east-ga-atlanta-102
flt dns delete west-ca-sd-101
flt dns delete west-ca-sd-102
flt dns delete west-wa-seattle-101
flt dns delete west-wa-seattle-102
flt dns delete corp-monitoring-101

# delete the RG
flt delete retail-edge-demo
flt delete red-fleet

# add Digital Ocean clusters
echo -e "east-nc-raleigh-101\t138.197.79.242" > "$(dirname "${BASH_SOURCE[0]}")/ips"
echo -e "east-nc-raleigh-102\t209.97.144.124" >> "$(dirname "${BASH_SOURCE[0]}")/ips"

# reset deploy and config
git pull
git reset -s origin/main config deploy

echo "run git commit / push to finish clean up"
