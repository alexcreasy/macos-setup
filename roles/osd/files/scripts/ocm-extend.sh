#!/usr/bin/env bash

# Extends expiration_timestamp of a cluster
set -e; set -o pipefail; # Fail early
    
CLUSTER_NAME=${1}
CLUSTER_ID=$( set -e; set -o pipefail; ocm get clusters --parameter search="name like '$CLUSTER_NAME'" | jq -r '.items[].id')
CLUSTER_BYOC=$(ocm get "/api/clusters_mgmt/v1/clusters/${CLUSTER_ID}" | jq -r .ccs.enabled)
    
if [ $CLUSTER_BYOC != 'true' ]; then  
    echo "This command should be used only with BYOC / CCS clusters"
    exit 1
fi
echo "Existing timestamp is "
ocm get /api/clusters_mgmt/v1/clusters/"${CLUSTER_ID}" | jq -r .expiration_timestamp
echo -e "\nEnter new time stamp"
read NEW_DATE
echo "{\"expiration_timestamp\": \"$NEW_DATE\"}" | ocm patch /api/clusters_mgmt/v1/clusters/"$CLUSTER_ID"
if [ $? -eq 0 ]; then
    echo "Cluster timestamp updated to:"
    ocm get /api/clusters_mgmt/v1/clusters/"${CLUSTER_ID}" | jq -r .expiration_timestamp
else
    echo "Cluster timestamp update FAILED"
    exit 1
fi

