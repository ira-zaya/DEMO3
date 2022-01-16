# =========| PUBLIC SUBNETS |=========

# # Create Public Subnet 1
# # terraform aws create subnet
# resource "aws_subnet" "public-subnet-1" {
#   vpc_id                  = aws_vpc.vpc.id
#   cidr_block              = "${var.public-subnet-1-cidr}"
#   availability_zone       = "eu-west-2a"
#   map_public_ip_on_launch = true

#   tags      = {
#     Name    = "Public Subnet 1"
#   }
# }


# # Create Public Subnet 2
# # terraform aws create subnet
# resource "aws_subnet" "public-subnet-2" {
#   vpc_id                  = aws_vpc.vpc.id
#   cidr_block              = "${var.public-subnet-2-cidr}"
#   availability_zone       = "eu-west-2b"
#   map_public_ip_on_launch = true

#   tags      = {
#     Name    = "Public Subnet 2"
#   }
# }

resource "aws_subnet" "public-subnet" {
  count = length(var.public-subnet-cidr)
  cidr_block              = tolist(var.public-subnet-cidr)[count.index]
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  depends_on = [
    aws_vpc.vpc
  ]

  tags      = {
    Name    = "${var.environment}-publicSubnet-${count.index + 1}"
    AvZones = data.aws_availability_zones.available.names[count.index]
    Env     = "${var.environment}-publicSubnet"
  }
}

# =====================================

# =========| PRIVATE SUBNETS |=========

# # Create Private Subnet 1
# # terraform aws create subnet
# resource "aws_subnet" "private-subnet-1" {
#   vpc_id                  = aws_vpc.vpc.id
#   cidr_block              = "${var.private-subnet-1-cidr}"
#   availability_zone       = "eu-west-2a"
#   map_public_ip_on_launch = false

#   tags      = {
#     Name    = "Private Subnet 1"
#   }
# }


# # Create Private Subnet 2
# # terraform aws create subnet
# resource "aws_subnet" "private-subnet-2" {
#   vpc_id                  = aws_vpc.vpc.id
#   cidr_block              = "${var.private-subnet-2-cidr}"
#   availability_zone       = "eu-west-2b"
#   map_public_ip_on_launch = false

#   tags      = {
#     Name    = "Private Subnet 2"
#   }
# }

resource "aws_subnet" "private-subnet" {
  count = length(var.private-subnet-cidr)
  cidr_block              = tolist(var.private-subnet-cidr)[count.index]
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  depends_on = [
    aws_vpc.vpc
  ]

  tags      = {
    Name    = "${var.environment}-privateSubnet-${count.index + 1}"
    AvZones = data.aws_availability_zones.available.names[count.index]
    Env     = "${var.environment}-privateSubnet"
  }
}

# =====================================