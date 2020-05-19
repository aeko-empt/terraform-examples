resource "aws_security_group" "sg" {
  name        = "sec_gp"
  description = "test_security_group"
  vpc_id      = data.aws_vpc.selected.id
  tags = {
    Name = "tag_secgp"
  }
}

data "aws_security_groups" "data_sg" {
  depends_on = [
    aws_security_group.sg
  ]
  filter {
    name   = "tag:Name"
    values = ["tag_secgp"]
  }
}
