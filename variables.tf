variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_profile" {
  description = "The AWS profile to use for authentication."
  type        = string
  default     = "sicepat-experiment"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to launch."
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet to launch the instance into."

  validation {
    condition     = length(regexall("^subnet-[\\d|\\w]+$", var.subnet_id)) == 1
    error_message = "The subnet_id must match the pattern ^subnet-[\\d|\\w]+$"
  }
}