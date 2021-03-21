!!! Disclaimer. Currently the configuration files haven't been tested therefore the success of all components is not guranteed.
!!! Notice also that In Azure there’s no concept of public and private subnets, but it is possible to update subnet specific route tables manually  
!!! and remove/update the Internet route. Alternatively, the same outcome can be achieved by not assigning a public IP address to a virtual machine.
!!! Notice that this hasn't been done in the code, since the purpose of this project is not to well architect the components or keep a DB service private
!!! but it is to introduce to an Azure infrastructure draft and basic Terraform orcherstration capabilities.

Purpose of this repository is an expression of
How would you create two modules in Github/Gitlab for components for templating via terraform (azureRM, Kubernetes and Helm provider):

a) Module for AKS
o Create AKS
o Create vnet
o Install Nginx or ambassador for ingress controller
o Should be setup with variables to customize and outputs for usage of other modules.

b) Module for Kubernetes deployment/service/ingress controller
o Should create a deployment.
o Should create service.
o Should create ingress controller.
o Should be setup with variables to customize and outputs for usage of other modules.


Azure Cloud Shell has Terraform pre-installed.
The Terraform configuration consists of two modules, along with a tree of child modules created when one module calls another. 
Includes, a main.tf, a variables.tf, a terraform.tfva and an outputs.tf file (if required).

├── README.md
├── main.tf
├── variables.tf
├── terraform.tfvar
├── outputs.tf

Before initializing Terraform run the terraform validate command. This command reads the configuration files in the directory and reports any syntax errors.

To initialize Terraform the init command is used to initialize a working directory containing Terraform configuration files.
This command downloads all required components, including modules and plugins automatically. Also, it initializes the state files.
 
The terraform plan command is used to create an execution plan. Terraform determines what actions are necessary to achieve the desired state specified in the configuration files.
terraform plan

Finally build the Azure Infrastructure or Deployment by running terraform apply. 
When you run terraform apply, Terraform reads any configuration files you have in the directory and prompts you for confirmation. 
Once you type "yes", it will then reach out to Azure and begin all associated resources
Type yes to create or update the infrastructure…
or use the parameter -auto-approve to skip the confirmation.
terraform apply -auto-approve
The terraform destroy command is used to destroy the Terraform-managed infrastructure.
terraform destroy
Enter yes to delete all resources…
or use the parameter -auto-approve to skip the confirmation.
terraform destroy -auto-approve
