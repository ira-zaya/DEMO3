# =========| VARIABLES |=========

variable "vpc-cidr" {
  default      = "10.0.0.0/16"
  description  = "VPC CIDR Block"
  type         = string
}

variable "vpc-cidr-0" {
  default      = "0.0.0.0/0"
  description  = "VPC CIDR Block 0"
  type         = string
}

variable "public-subnet-1-cidr" {
  default      = "10.0.10.0/24"
  description  = "Public Subnet 1 CIDR Block"
  type         = string
}

variable "public-subnet-2-cidr" {
  default      = "10.0.20.0/24"
  description  = "Public Subnet 2 CIDR Block"
  type         = string
}

variable "private-subnet-1-cidr" {
  default      = "10.0.11.0/24"
  description  = "Private Subnet 1 CIDR Block"
  type         = string
}

variable "private-subnet-2-cidr" {
  default      = "10.0.21.0/24"
  description  = "Private Subnet 2 CIDR Block"
  type         = string
}

variable "ssh-location" {
  default      = "0.0.0.0/0"
  description  = "IP Address that can SSH into the EC2 Instance"
  type         = string
}

variable "server_port" {
  default     = 8080
  description = "The port the server will use for HTTP requests"
  type        = number
}

variable "eip" {
  description = "Create EIPs with different names"
  type = list(string)
  default = ["EIP 1", "EIP 2"]
}
# =================================

# variable "" {
#   default = ["NAT Gateway public subnet 1", "NAT Gateway public subnet 2"]

# }

# variable "public_subnet" {

# }

locals {
  repository_name = format("%s-%s", var.app_name, var.environment)
}



variable "fargate_memory" {
  default = 512
}

variable "fargate_cpu" {
  default = 256
}

locals {
  ecr_repository_url = format("%s:%s", "581835478100.dkr.ecr.eu-west-2.amazonaws.com/hello-dev", "nginx")
}


variable "environment" {
  default = "dev"
}


variable "app_name" {
  default = "hello"
}


variable "aws_account" {
  default = "581835478100"
}

variable "aws_region" {
  default = "eu-west-2"
}

variable "repo_url" {
  type = string
  default = "hello-dev"
}

variable "image_tag" {
  type = string
  default = "0.0.1"
}

variable "ecr_repo_url" {
  type = string
  default = "581835478100.dkr.ecr.eu-west-2.amazonaws.com"
}

variable "script" {
  description = "Build script file"
  type        = string
  default     = "build-docker.sh"
}

variable "working_dir" {
  description = "Application location"
  type        = string
  default     = "./app"
}

variable "ecs_task_role_name" {
  default = "TaskRole"
}

variable "ecs_task_execution_role_name" {
  default = "TaskExRole"
}