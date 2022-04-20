#!/bin/bash


line=$(tail -n 1 test/integration-trigger.txt)
arr=($(echo $line | tr ";" "\n"))
host=${arr[1]}
echo "::set-output name=DEPLOYER_HOST::$(echo ${host})"

if [[ ${host} == "pi-app-deployer-staging" ]]; then
  echo "::set-output name=PI_APP_DEPLOYER_API_KEY::$(echo ${PI_APP_DEPLOYER_API_KEY_STAGING})"
else
  echo "::set-output name=PI_APP_DEPLOYER_API_KEY::$(echo ${PI_APP_DEPLOYER_API_KEY_PROD})"
fi
