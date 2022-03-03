#!/usr/bin/env bash

SECRET_NAME=$(kubectl get serviceaccount admin-user -o jsonpath='{$.secrets[0].name}')
TOKEN=$(kubectl get secret "${SECRET_NAME}" -o jsonpath='{$.data.token}' | base64 -d | sed $'s/$/\\\n/g')

echo "$TOKEN"
