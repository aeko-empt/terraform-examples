resource "aws_network_acl" "network_acl" {
  vpc_id = data.aws_vpc.selected.id

  tags = {
    Name = "tag_netacl"
  }
}

data "aws_network_acls" "data_netacl" {
  vpc_id = data.aws_vpc.selected.id
  depends_on = [
    aws_network_acl.network_acl
  ]
  filter {
    name   = "tag:Name"
    values = ["tag_netacl"]
  }
}
