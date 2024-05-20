# blue-green-deployment

# K8s Terraform
To deploy, run the following commands from the project root:
1. `cd k8s-terraform`
2. `terraform init`
3. `terraform apply`

# Deployment Verification
Run the following command to validate api deployment: `curl http://localhost`

## Cleanup
Run the following command to dispose of created services: `terraform destroy`

# K8s Local
To deploy, run the following commands from the project root:
- `cd k8s-local`
- `kubectl apply -f .\deployment.yml`
- `kubectl get deployments` OR `kubectl describe deployment simple-webapp` to validate deployment creation.
- `kubectl apply -f .\service.yml`

# Deployment Verification
Run the following command to validate api deployment: `curl http://localhost`

## Cleanup
Run the following commands to dispose of created services: 
1. `kubectl delete service/simple-webapp`
2. `kubectl delete deployment/simple-webapp`


## Azure
To deploy the Azure servies:
- Install az CLI
- `az login`
- `az account set --subscription '<SUBSCRIPTION_ID>'`
- cd `cd .\k8s-terraform\azure`
- `terraform init`
- `terraform apply`

For troubleshooting: 
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#example-usage
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli