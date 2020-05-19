resource "aws_key_pair" "key_pair" {
  key_name   = "test_key_pair1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9cjSpitHcz3A2p0TobQiaZVm7mvBPMZUHZnLFJlHYPxo3Twj4HuxXfocfGmE0Ud9Gb9cNq7lLPbYcej/M7XEIETifXFALrs0c+AHXVevUo6KNYMfM3W1e2u5M9DQmYswLxrKDDqK9D7bR28ATqI+X81MjyBjSP14FxsTRac4+lo/RyqnKvlvyGQbI8LWPpMw+Afvj/3vBRR1MBNUI9D9VAkP1Af7CL/P4ZSAtrHs1IGAQZzh480lDtquixRb7XDRlYysYmJhOkIlAkkFvi87cXKrBj8s5wcqIZbTdGTXkQU1YEdSU4oWUoFrXTQPaEwauRZB+tkz0VwMkLHbSJb4b ec2-user@ip-172-31-1-10"
  tags = {
    Name = "tag_key_pair"
  }
}
