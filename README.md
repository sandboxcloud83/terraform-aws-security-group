# Terraform AWS Security Group Module

## Overview

This module creates and manages an AWS Security Group. It is designed to be highly flexible, allowing for dynamic ingress and egress rules.

A Security Group acts as a virtual firewall for your instance to control inbound and outbound traffic.

## Usage

```hcl
module "web_server_sg" {
  source = "path/to/terraform-aws-security-group"

  name        = "web-server-sg"
  description = "Security group for web servers"
  vpc_id      = "vpc-12345678"

  ingress_rules = [
    {
      description = "Allow HTTP from anywhere"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS from anywhere"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}
```
## Requirements

The following requirements are needed by this module:

| Name      | Version |
|-----------|---------|
| terraform | >= 1.0  |
| aws       | >= 5.0  |

## Inputs

| Name          | Description                                                      | Type        | Default                | Required |
|---------------|------------------------------------------------------------------|-------------|------------------------|:--------:|
| name          | The name of the security group.                                  | string      | n/a                    |   yes    |
| description   | A description for the security group.                            | string      | "Managed by Terraform" |   no     |
| vpc_id        | The ID of the VPC where the security group will be created.      | string      | n/a                    |   yes    |
| ingress_rules | A list of ingress rules to apply.                                | list(any)   | []                     |   no     |
| egress_rules  | A list of egress rules to apply.                                 | list(any)   | []                     |   no     |
| tags          | A map of tags to apply to the security group.                    | map(string) | {}                     |   no     |

## Outputs

| Name                  | Description                          |
|-----------------------|--------------------------------------|
| security_group_id     | The ID of the created security group.  |
| security_group_arn    | The ARN of the created security group.   |
| security_group_name   | The name of the created security group.|

## Resources

The following resources are created by this module:

| Name                                                                                 | Type     |
|--------------------------------------------------------------------------------------|----------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |