# Use var select_vpc for choose which a vpc use. 1 - new vpc, 0 - default vpc.

variable "select_vpc" {
    type = bool
    description = "Choose var for create vpc: 1 - new vpc, 0 - default vpc"

# TODO set default = "1" and create this var in the resources.tfvars file
}

# Own VPC
resource "aws_vpc" "own_vpc" {
  count = var.select_vpc ? 1 : 0
  cidr_block = "192.168.10.0/24"
  tags = {
      Name = "tag_vpc"
  }
}

# Default VPC
resource "aws_default_vpc" "default_vpc" {
  count = var.select_vpc ? 0 : 1
  tags = {
      Name = "tag_vpc"
  }
}

# With filter you can choose vpc, just select correct tag.
data "aws_vpc" "selected" {
  depends_on = [
    aws_vpc.own_vpc, aws_default_vpc.default_vpc
  ]
  filter {
    name   = "tag:Name"
    values = ["tag_vpc"]
  }
}
