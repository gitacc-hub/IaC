#!/bin/bash

# Fail immediately if a command fails
set -e

# Check if Azure CLI is installed
if ! command -v az &> /dev/null
then
    echo "Azure CLI not found. Please install Azure CLI first."
    exit 1
fi

# Check if user is logged in to Azure
if ! az account show &> /dev/null
then
    echo "You are not logged in to Azure. Run: az login"
    exit 1
fi

LOCATION="eastus"
RESOURCE_GROUP="rg-cli-demo-001"

# Generate a unique storage account name
STORAGE_ACCOUNT="stadfcli$(tr -dc 'a-z0-9' </dev/urandom | head -c 4)"

# Create resource group
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

# Create storage account
az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --sku Standard_LRS