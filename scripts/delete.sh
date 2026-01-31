#!/bin/bash

RESOURCE_GROUP="rg-cli-demo-001"

# Delete the resource group (and everything inside it)
az group delete \
  --name $RESOURCE_GROUP \
  --yes \
  --no-wait
