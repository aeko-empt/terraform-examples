resource "aws_ebs_snapshot" "data_snap" {
  volume_id = data.aws_ebs_volume.data_vol.id
  description = "test_snapshot_from_${data.aws_ebs_volume.data_vol.id}"

  tags = {
    Name = "tag_snap"
  }
}

data "aws_ebs_snapshot" "data_snap" {
  depends_on = [
    aws_ebs_snapshot.data_snap
  ]
  filter {
    name   = "tag:Name"
    values = ["tag_snap"]
  }
}
