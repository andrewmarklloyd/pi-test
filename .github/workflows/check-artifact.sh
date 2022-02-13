#!/bin/bash


retries=0
found=false
while [[ ${found} == false ]]; do
  artifacts=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/andrewmarklloyd/pi-test/actions/artifacts | grep "app_${GITHUB_SHA}")
  if [[ ! -z ${artifacts} ]]; then
    found=true
  else
    echo "Artifact not found, retrying in 5 seconds"
    retries=$((retries+1))
    sleep 5
  fi
  if (( ${retries} >= 5 )); then
    echo "Max retries exceeded, failing now"
    exit 1
  fi
done

