resource "aws_route_table" "rt" {
  vpc_id = data.aws_vpc.selected.id
  tags = {
    Name = "tag_rt"
  }
}

data "aws_route_table" "data_rt" {
  vpc_id = data.aws_vpc.selected.id
  depends_on = [
    aws_route_table.rt
  ]
  filter {
    name   = "tag:Name"
    values = ["tag_rt"]
  }
}

resource "aws_route_table_association" "rt_association" {
  subnet_id      = data.aws_subnet.data_subnet.id
  route_table_id = data.aws_route_table.data_rt.id
}
