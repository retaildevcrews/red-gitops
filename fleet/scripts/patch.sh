#!/bin/bash
echo "$(date +'%Y-%m-%d %H:%M:%S')  patched" >> /home/akdc/status

sudo sed -i  "s@\/home\/akdc\/akdc\/fleet\/bin@\/home\/akdc\/gitops\/bin@g" /etc/bash.bashrc

echo "$(hostname) patched"
