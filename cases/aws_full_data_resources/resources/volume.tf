resource "aws_ebs_volume" "volume" {
  availability_zone = var.az
  size              = 32

  tags = {
    Name = "tag_vol"
  }
}

data "aws_ebs_volume" "data_vol" {
  depends_on = [
    aws_ebs_volume.volume
  ]
  filter {
    name   = "tag:Name"
    values = ["tag_vol"]
  }
}
