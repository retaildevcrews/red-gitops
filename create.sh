#!/bin/bash

echo "edit create.sh before running"
exit 0

# change to this directory
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# add Digital Ocean clusters
echo -e "east-nc-raleigh-101\t138.197.79.242" > "$(dirname "${BASH_SOURCE[0]}")/ips"
echo -e "east-nc-raleigh-102\t209.97.144.124" >> "$(dirname "${BASH_SOURCE[0]}")/ips"

# make sure the env vars are correct
export AKDC_SSL=cseretail.com
export AKDC_DNS_RG=tld
export AKDC_GITOPS=true
export AKDC_BRANCH=$(git branch --show-current)
export AKDC_REPO=retaildevcrews/red-gitops

flt create --arc --gitops -g red-fleet -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com \
    -c central-mo-kc-101 \
    -c central-mo-kc-102 \
    -c central-tx-austin-101 \
    -c central-tx-austin-102 \
    -c east-ga-atlanta-101 \
    -c east-ga-atlanta-102 \
    -c west-ca-sd-101 \
    -c west-ca-sd-102 \
    -c west-wa-seattle-101 \
    -c west-wa-seattle-102 \
    -c corp-monitoring
