#!/bin/bash

response=$(curl -s -X POST -H "api-key: ${PI_APP_DEPLOYER_API_KEY}" -d '{"sha":"${{ github.sha }}","repository":"${{ github.repository }}","name":"app_${{ github.sha }}","manifest_name":"pi-test-arm"}' https://pi-app-deployer.herokuapp.com/push)
echo ${response}
if [[ $(echo ${response} | jq -r '.status') != "success" ]]; then
  exit 1
fi
