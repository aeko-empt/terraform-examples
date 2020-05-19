resource "aws_vpc_dhcp_options" "dhcp_opt" {
  domain_name          = "test.domain.zy"
  domain_name_servers  = ["127.0.0.1", "1.1.1.1"]
  ntp_servers          = ["2.2.2.2"]
#  netbios_name_servers = ["127.0.0.1"]
#  netbios_node_type    = 2

  tags = {
    Name = "tag_dhcp_opt"
  }
}

data "aws_vpc_dhcp_options" "data_dhcp_opt" {
  depends_on = [
    aws_vpc_dhcp_options.dhcp_opt
  ]
  tags = {
    Name = "tag_dhcp_opt"
  }
}


resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = data.aws_vpc.selected.id
  dhcp_options_id = data.aws_vpc_dhcp_options.data_dhcp_opt.id
}
