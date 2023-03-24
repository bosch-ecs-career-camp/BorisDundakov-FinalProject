export RESOURCE_GROUP_NAME=BorisDundakov_RG_FinalProject
export AKS_NAME=VM_Cluster
export LOCATION=francecentral
export VM_SIZE=Standard_DS2_v2

SSH_KEY=$1
#SSH_KEY=take input


#1. Create cluster

az aks create \
	-g $RESOURCE_GROUP_NAME \
	-n $AKS_NAME \
	--ssh-key-value $SSH_KEY \
	-l $LOCATION \
	--node-count 1 \
	--node-vm-size $VM_SIZE \
	--network-plugin azure \
	
#2. Create h2o-wave pod and run it






#2. Run h2o-wave pipe with app

#3. Run Sonarqube pipe with sever and webhook
