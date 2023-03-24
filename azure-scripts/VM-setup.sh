#usr/bin/bash

export RESOURCE_GROUP_NAME=BorisDundakov_RG_FinalProject
export LOCATION=francecentral
export VM_NAME=VM1
export VM_IMAGE=UbuntuLTS

export VNET_NAME=virtual_network
export VNET_SUBNET_NAME=default

SSH_KEY={{ secrets.SSH_KEY }}

export VNET_ADDRESS_PREFIX='10.0.0.0/16'
export SUBNET_PREFIX='10.0.0.0/24'


VM_USER={{ secrets.VM_USER }}
VM_PASS={{ secrets.VM_PASS }}

#export VM_USER="bobi"
#export VM_PASS="@Azurepass123"

# 1. Create a resource group

az group create \
  -l $LOCATION \
  -n $RESOURCE_GROUP_NAME

#2.1 Deploy a VNET (don't forget the subnet!!)

# az network vnet create --address-prefixes 10.0.0.0/16 --name MyVirtualNetwork --resource-group test-rg  --subnet-name MyAseSubnet --subnet-prefixes 10.0.0.0/24

az network vnet create \
  --address-prefixes $VNET_ADDRESS_PREFIX \
  -n $VNET_NAME \
  -g $RESOURCE_GROUP_NAME \
  --subnet-name $VNET_SUBNET_NAME \
  --subnet-prefixes $SUBNET_PREFIX

#2.2 Create 2 VM's with private IP's only and assign them to the VNET!


az vm create \
  -n $VM_NAME \
  -g $RESOURCE_GROUP_NAME \
  #--public-ip-address "" \
  --image $VM_IMAGE \
  --vnet-name $VNET_NAME \
  --subnet $VNET_SUBNET_NAME \
  --ssh-key-values $SSH_KEY \
  --admin-username $VM_USER \
  --admin-password $VM_PASS