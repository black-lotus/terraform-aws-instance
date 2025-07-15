terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "The AWS Region to connect and run the tests in."
}

variable "aws_profile" {
  description = "The AWS profile to use for authentication."
  type        = string
  default     = "sicepat-experiment"
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}