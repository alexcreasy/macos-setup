#!/usr/bin/env bash

NAME=$1; CLUSTER=$(ocm get clusters | jq '.items[] | select(.name == "'${NAME}'")');
DATE=$(date -v +1d +"%Y-%m-%dT%H:%M:%SZ");

echo "{\"expiration_timestamp\": \"$DATE\"}" | ocm patch /api/clusters_mgmt/v1/clusters/"$(echo $CLUSTER | jq '.id' -r)";

