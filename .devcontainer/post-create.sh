#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "post-create start"
echo "$(date +'%Y-%m-%d %H:%M:%S')    post-create start" >> "$HOME/status"

export PATH="$PATH:$PWD/bin"

# update oh-my-zsh
git -C "$HOME/.oh-my-zsh" pull

# secrets are not available during on-create

mkdir -p "$HOME/.ssh"

if [ "$GITHUB_TOKEN" != "" ]
then
    echo "$GITHUB_TOKEN" > "$HOME/.ssh/akdc.pat"
    chmod 600 "$HOME/.ssh/akdc.pat"
fi

# add shared ssh key
if [ "$ID_RSA" != "" ] && [ "$ID_RSA_PUB" != "" ]
then
    echo "$ID_RSA" | base64 -d > "$HOME/.ssh/id_rsa"
    echo "$ID_RSA_PUB" | base64 -d > "$HOME/.ssh/id_rsa.pub"
    chmod 600 "$HOME"/.ssh/id*

    # get secrets from key vault
    flt az login
    echo -n "$(az keyvault secret show --vault-name kv-tld  --query 'value' -o tsv -n akdc-pat)" > "$HOME/.ssh/akdc.pat"
    echo -n "$(az keyvault secret show --vault-name kv-tld  --query 'value' -o tsv -n ssl-crt)" > "$HOME/.ssh/certs.pem"
    echo -n "$(az keyvault secret show --vault-name kv-tld  --query 'value' -o tsv -n ssl-key)" > "$HOME/.ssh/certs.key"
    echo -n "$(az keyvault secret show --vault-name kv-tld  --query 'value' -o tsv -n fluent-bit-secret)" > "$HOME/.ssh/fluent-bit.key"
    echo -n "$(az keyvault secret show --vault-name kv-tld  --query 'value' -o tsv -n prometheus-secret)" > "$HOME/.ssh/prometheus.key"
    echo -n "$(az keyvault secret show --vault-name kv-tld  --query 'value' -o tsv -n event-hub-secret)" > "$HOME/.ssh/event-hub.key"
fi

echo "post-create complete"
echo "$(date +'%Y-%m-%d %H:%M:%S')    post-create complete" >> "$HOME/status"
