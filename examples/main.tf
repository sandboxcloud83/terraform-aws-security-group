# trivy:ignore:AVD-AWS-0178[Se omite Flow Logs intencionalmente para una prueba rápida y aislada del módulo SG]
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test-vpc-for-sg-module"
  }
}

module "web_server_sg" {
  source = "../"

  name        = "web-server-sg-test"
  description = "Security group for web server testing"
  vpc_id      = aws_vpc.test_vpc.id

  ingress_rules = [
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Environment = "test"
    ManagedBy   = "Terraform"
  }
}
