#variable "create_ami" {
#  type = bool
#}

resource "aws_ami" "my_ami" {
#  count = var.create_ami ? 1 : 0
  name = "my-image"
  description = "test_ami_from_c2_image"
  virtualization_type = "kvm-virtio"
  root_device_name  = "disk1"

  ebs_block_device {
    device_name = "disk1"
    snapshot_id = "snap-DDFAA984"
    volume_size = 1
  }
  tags = {
      Name = "tag_ami"    # key = Name, Values = tag_ami
  }
}

data "aws_ami" "data_ami" {
  most_recent = true    # If search has a few result, the newer will be choose
  owners = ["self"]

  depends_on = [
    aws_ami.my_ami
  ]

  filter {
    name   = "tag:Name"
    values = ["tag_ami"]
  }
}
