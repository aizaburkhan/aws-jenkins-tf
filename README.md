# terraform-aws-vpc-group-4

<h2>Precondition</h2>

```
From your Bastion instance
- Manually create an S3 bucket
- Navigate to backend.tf and replace the S3 bucket name on the line 4
- Manually create DynamoDB with "Partition key= LockID"
- Navigate to backend.tf and replace the DynamoDB Table name on the line 7

Create .tfvars files under the regions folder as below, and provide the region:
- virginia.tfvars        # save region = "us-east-1"
- ohio.tfvars		 # save region = "us-east-2"
- california.tfvars      # save region = "us-west-1"
- oregon.tfvars		 # save region = "us-west-2"

```

<h2>The Module</h2>

```
module "vpc-group-4" {
  source  = "akadyrakunov/vpc-group-4/aws"
  version = "0.0.2"
}

```

 <h2>The Usage</h2>

 ```

The User has 4 regions to choose from where the Instance (with installed Jenkins) and Private VPC can be created:
- Virginia (us-east-1)
- Ohio (us-east-2)
- California (us-west-1)
- Oregon (us-west-2)

All commands will be Run from Makefile. Details can be find under Makefile CONFIG.

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

<h2>What our terraform include:</h2> 

```

Main.tf file enables the private VPC creation with all the necessary components, and ensures the inbound rule for port 8080 is open to install and run Jenkins application. Remote-exec and file provisioners copy the Jenkins installation bash script from Bastion to Test instance.

Ec2.tf file creates the instance in the region and provided public keys for passwodless ssh connection.

Once the Instance is up and running, the remote exec launches the jenkinsRun.sh script and installs Jenkins

<strong>To check if Jenkins was installed, get the public IP of the instance and paste in the search bar of the browser. Add :8080 to the public ip </strong>

The Jenkins intallation steps are under jenkinsRun.sh file.

```

 <h2>Terraform will perform the following actions:</h2> 

```

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-xxxxxxxxxxxxx"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "my-key"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "group4-ec2"
        }
      + tags_all                             = {
          + "Name" = "group4-ec2"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_internet_gateway.gw will be created
  + resource "aws_internet_gateway" "gw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "internet-gw"
        }
      + tags_all = {
          + "Name" = "internet-gw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_key_pair.key will be created
  + resource "aws_key_pair" "key" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "my-key"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = "xxxxxxxxxxxxxxxxx"
      + tags_all        = (known after apply)
    }

  # aws_route_table.rt_table will be created
  + resource "aws_route_table" "rt_table" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "rt-table"
        }
      + tags_all         = {
          + "Name" = "rt-table"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.a will be created
  + resource "aws_route_table_association" "a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.b will be created
  + resource "aws_route_table_association" "b" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.c will be created
  + resource "aws_route_table_association" "c" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "For HTTP"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "For Jenkins"
              + from_port        = 8080
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8080
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "For SSH"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "allow_tls"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.sb1 will be created
  + resource "aws_subnet" "sb1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "subnet-1"
        }
      + tags_all                                       = {
          + "Name" = "subnet-1"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.sb2 will be created
  + resource "aws_subnet" "sb2" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "subnet-2"
        }
      + tags_all                                       = {
          + "Name" = "subnet-2"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.sb3 will be created
  + resource "aws_subnet" "sb3" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "subnet-3"
        }
      + tags_all                                       = {
          + "Name" = "subnet-3"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "group4-vpc"
        }
      + tags_all                             = {
          + "Name" = "group4-vpc"
        }
    }

```

