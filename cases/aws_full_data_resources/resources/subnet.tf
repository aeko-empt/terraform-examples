resource "aws_subnet" "subnet" {
  availability_zone = var.az
  vpc_id            = data.aws_vpc.selected.id

  cidr_block = cidrsubnet(data.aws_vpc.selected.cidr_block, 1, 0)
  tags = {
    Name = "tag_subnet"
  }
}

data "aws_subnet" "data_subnet" {
  vpc_id            = data.aws_vpc.selected.id
  depends_on = [
    aws_subnet.subnet
  ]
  filter {
    name   = "tag:Name"
    values = ["tag_subnet"]
  }
}