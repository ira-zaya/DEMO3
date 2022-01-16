# =========| EIP |=========

# Allocate Elastic IP Address (EIP 1)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway" {
  vpc    = true
  count = length(var.eip)
  tags   = {
    Name = "${var.eip[count.index]}"
  }
}

# =========================

# =========| NAT GATEWAYS |=========

# Create Nat Gateway 1 in Public Subnet 1
# terraform create aws nat gateway
# resource "aws_nat_gateway" "nat-gateway-1" {
#   allocation_id = aws_eip.eip-for-nat-gateway[0].id
#   subnet_id     = aws_subnet.public-subnet[0].id

#   tags   = {
#     Name = "NAT Gateway Public Subnet 1"
#   }
# }

# # Create Nat Gateway 2 in Public Subnet 2
# # terraform create aws nat gateway
# resource "aws_nat_gateway" "nat-gateway-2" {
#   allocation_id = aws_eip.eip-for-nat-gateway[1].id
#   subnet_id     = aws_subnet.public-subnet[1].id

#   tags   = {
#     Name = "NAT Gateway Public Subnet 2"
#   }
# }

resource "aws_nat_gateway" "nat-gateway" {
  count = 2
  allocation_id = element(aws_eip.eip-for-nat-gateway.*.id, count.index)
  subnet_id     = element(aws_subnet.public-subnet.*.id, count.index)

  tags = {
    Name = "NAT Gateway Public Subnet ${count.index}"
  }
}
# =================================



