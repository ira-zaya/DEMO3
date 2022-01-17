locals {
  repository_name = format("%s-%s", var.app_name, var.environment)
}

variable "environment" {
  default = "dev"
}

variable "app_name" {
  default = "hello"
}

variable "fargate_memory" {
  default = 512
}

variable "fargate_cpu" {
  default = 256
}

variable "http-port" {
  type = number
  default = 80
}
