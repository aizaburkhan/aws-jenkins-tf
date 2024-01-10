variable "region" {
  type        = string
  description = "Provide region"
  default     = "us-east-1"
}

variable "vpc-cidr_block" {
  type        = string
  description = "Provide cidr_block"
  default     = "10.0.0.0/16"
}

variable "subnet1-cidr_block" {
  type        = string
  description = "Provide cidr_block"
  default     = "10.0.1.0/24"
}

variable "subnet2-cidr_block" {
  type        = string
  description = "Provide cidr_block"
  default     = "10.0.2.0/24"
}

variable "subnet3-cidr_block" {
  type        = string
  description = "Provide cidr_block"
  default     = "10.0.3.0/24"
}

variable "rt-table_cidr_block" {
  type        = string
  description = "Provide cidr_block"
  default     = "0.0.0.0/0"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "true/false"
  default     = true
}

variable "instance_type_t2micro" {
  type        = string
  description = "Provide Instane type"
  default     = "t2.micro"
}

variable "instance_type_t2large" {
  type        = string
  description = "Provide Instane type"
  default     = "t2.large"
}

variable "ingress_rules" {
  default = {
    "80" = {
      description = "For HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    "22" = {
      description = "For SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    "8080" = {
      description = "For Jenkins"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Allow TLS inbound traffic"
}

variable "bucket" {
  type        = string
  default     = "3-statefile-backends-ak"
}