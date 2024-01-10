# terraform-aws-vpc-group-4

```
Makefile CONFIG

# make viginia
virginia:
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform apply -var-file regions/virginia.tfvars --auto-approve

# make ohio
ohio:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform apply -var-file regions/ohio.tfvars --auto-approve

# make california
california:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform apply -var-file regions/california.tfvars --auto-approve

# make oregon
oregon:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform apply -var-file regions/oregon.tfvars --auto-approve

# make apply-all
apply-all: virginia ohio california oregon

# make virginia-destroy
virginia-destroy:
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform destroy -var-file regions/virginia.tfvars --auto-approve

# make ohio-destroy
ohio-destroy:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform destroy -var-file regions/ohio.tfvars --auto-approve

# make california-destroy
california-destroy:
	terraform workspace new california || terraform workspace select california
	terraform init
	terraform destroy -var-file regions/california.tfvars --auto-approve

# make oregon-destroy
oregon-destroy:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform destroy -var-file regions/oregon.tfvars --auto-approve

# make destroy-all
destroy-all: virginia-destroy ohio-destroy california-destroy oregon-destroy

 

 THE USAGE

    VPC
    EC2
    Jenkins Installation
 ```