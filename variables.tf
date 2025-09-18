variable "name" {
  description = "The name of the security group."
  type        = string
}

variable "description" {
  description = "A description for the security group."
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}

variable "ingress_rules" {
  description = "A list of ingress rules to apply to the security group. Each rule is an object."
  type        = list(any)
  default     = []
}

variable "egress_rules" {
  description = "A list of egress rules to apply to the security group. Each rule is an object."
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "A map of tags to apply to the security group."
  type        = map(string)
  default     = {}
}
