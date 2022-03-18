#!/bin/bash

response=$(curl -s -X POST -H "api-key: ${PI_APP_DEPLOYER_API_KEY}" -d "{\"sha\":\"${GITHUB_SHA}\",\"repoName\":\"andrewmarklloyd/pi-test\",\"name\":\"app_${GITHUB_SHA}\",\"manifestName\":\"pi-test-arm\"}" https://pi-app-deployer.herokuapp.com/push)
echo ${response}
if [[ $(echo ${response} | jq -r '.status') != "success" ]]; then
  exit 1
fi

max=24 # 5 second wait means 2 min timeout
count=0
condition='UNKNOWN'
while [[ ${condition} != 'SUCCESS' ]]; do
    if (( ${count} >= ${max} )); then
        echo "Max number of retries exceeded. Deploy condition: ${condition}"
        exit 1
    fi
    echo "Attempt number ${count}"
    status=$(curl -s -X GET -H "api-key: ${PI_APP_DEPLOYER_API_KEY}" -d '{"repository":"andrewmarklloyd/pi-test","manifest_name":"pi-test-arm"}' https://pi-app-deployer.herokuapp.com/deploy/status)

    if [[ $(echo ${status} | jq -r '.status') != 'success' ]]; then
        echo ${status}
        exit 1
    fi
    condition=$(echo ${status} | jq -r '.condition')
    echo "Deploy condition: ${condition}"
    ((count=count+1))
    sleep 5
done

echo "Deploy success"
