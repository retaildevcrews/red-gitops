#!/bin/bash

echo "uncomment the commands before running"

# change to this directory
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# add Digital Ocean clusters
#echo -e "east-nc-raleigh-101\t138.197.79.242" > "$(dirname "${BASH_SOURCE[0]}")/ips"
#echo -e "east-nc-raleigh-102\t209.97.144.124" >> "$(dirname "${BASH_SOURCE[0]}")/ips"

#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c central-tx-austin-101 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c central-tx-austin-102 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c central-mo-kc-101 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c central-mo-kc-102 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c east-ga-atlanta-101 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c east-ga-atlanta-102 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c west-ca-sd-101 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c west-ca-sd-102 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c west-wa-seattle-101 &
#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c west-wa-seattle-102 &

#flt create --arc -g retail-edge-demo -l centralus --repo retaildevcrews/red-gitops --ssl cseretail.com -c corp-monitoring &

### simulated redmond clusters
#flt create --arc -g retail-edge-demo -l centralus    --repo retaildevcrews/red-gitops --ssl cseretail.com -c west-wa-redmond-101 &
#flt create --arc -g retail-edge-demo -l centralus    --repo retaildevcrews/red-gitops --ssl cseretail.com -c west-wa-redmond-102 &
