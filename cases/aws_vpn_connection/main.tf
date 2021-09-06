resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

data "aws_vpn_gateway" "vgw" {
  attached_vpc_id = aws_vpc.vpc.id
}

#output "vpn_gateway_id" {
#  value = data.aws_vpn_gateway.selected.id
#}

resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = 65000
  ip_address = "31.1.1.1"
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = data.aws_vpn_gateway.vgw.id
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = false
}