#!/bin/bash
set -e
terraform state list > resources.txt
jq -R -s -c 'split("\n") | map(select(length > 0))' resources.txt > resource-manifest.json
aws s3 cp resource-manifest.json s3://terraform-artifacts/resource-manifest.json
