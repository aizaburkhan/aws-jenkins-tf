# terraform-aws-vpc-group-4

<h2>The Usage</h2>

```
module "vpc-group-4" {
  source  = "akadyrakunov/vpc-group-4/aws"
  version = "0.0.2"
}

```


<h2>Makefile CONFIG</h2>

```
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

```

 <h2>TBD</h2>
The User has the option of 4 Regions where wants to install an Instance.

TBD 

```
aws_key_pair.key: Creating...
aws_vpc.main: Creating...
aws_key_pair.key: Creation complete after 1s [id=my-key]
aws_vpc.main: Creation complete after 2s [id=vpc-0bcc5e2492668229c]
aws_subnet.sb1: Creating...
aws_internet_gateway.gw: Creating...
aws_subnet.sb2: Creating...
aws_subnet.sb3: Creating...
aws_security_group.allow_tls: Creating...
aws_internet_gateway.gw: Creation complete after 1s [id=igw-0919574294ab37d18]
aws_route_table.rt_table: Creating...
aws_route_table.rt_table: Creation complete after 1s [id=rtb-09e2a3c2be6e20698]
aws_security_group.allow_tls: Creation complete after 3s [id=sg-0c9ada169af8ed77c]
aws_subnet.sb1: Still creating... [10s elapsed]
aws_subnet.sb2: Still creating... [10s elapsed]
aws_subnet.sb3: Still creating... [10s elapsed]
aws_subnet.sb1: Creation complete after 11s [id=subnet-0a08b7ef17e559954]
aws_route_table_association.a: Creating...
aws_subnet.sb2: Creation complete after 12s [id=subnet-0a4d55a8a63806a10]
aws_route_table_association.b: Creating...
aws_subnet.sb3: Creation complete after 12s [id=subnet-01b26c141ba8d94d0]
aws_route_table_association.a: Creation complete after 1s [id=rtbassoc-0801fd6dc18f555f3]
aws_route_table_association.c: Creating...
aws_route_table_association.c: Creation complete after 0s [id=rtbassoc-022359607bb924305]
aws_route_table_association.b: Creation complete after 0s [id=rtbassoc-0c85f5b5c6503e579]
```

