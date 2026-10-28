## going to create a custom VPN by name my-custom-vpc
##go to terraform documentation and get the syntax

resource "aws_vpc" "tvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-custom-vpc"
  }
}

##going to create 2 subnets inside this VPC in different availablity zone.
resource "aws_subnet" "tsubnet" {
  for_each          = var.subnet
  vpc_id            = aws_vpc.tvpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = each.key
  }

  map_public_ip_on_launch = each.key == "public_subnet"
}


##going to create a route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.tvpc.id

  tags = {
    Name = "Route-Table"
  }

}

##create a internet gatewat to be attached in to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tvpc.id

  tags = {
    Name = "IGW"
  }
}

##now let us create routes for this VPC
resource "aws_route" "rt" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

##now associate public subnet to the IGW for internet access
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.tsubnet["public_subnet"].id
  route_table_id = aws_route_table.public_rt.id
}