resource "aws_placement_group" "placement_group" {
  name     = "test_placement_group"
  strategy = "spread"
}
