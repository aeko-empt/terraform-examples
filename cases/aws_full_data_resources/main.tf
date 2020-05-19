#variable "create_instance" {
#    type = bool
#}

resource "aws_instance" "test_instance" {
#  count = var.create_instance ? 1 : 0
  ami                                  = data.aws_ami.data_ami.id

  availability_zone                    = var.az
  instance_type                        = var.instance_type
  vpc_security_group_ids               = data.aws_security_groups.data_sg.ids
  subnet_id                            = data.aws_subnet.data_subnet.id
  placement_group                      = aws_placement_group.placement_group.name
  key_name                             = aws_key_pair.key_pair.key_name

  ebs_block_device {
    device_name = "disk2"
    snapshot_id = data.aws_ebs_snapshot.data_snap.id
  }

  tags = {
    Name = "tag_instance"
  }
}

data "aws_instance" "data_instance" {
  depends_on = [
    aws_instance.test_instance
  ]
  filter {
    name   = "tag:Name"
    values = ["tag_instance"]
  }
}