resource "aws_vpc" "Demo_vpc"{
cidr_block = "10.0.0.0/16"
tags = {
    name = "Demo_terraform_VPC"
}
}
 
resource "aws_subnet" "public_subnet"{
    vpc_id = aws_vpc.Demo_vpc.id
    cidr_block = "10.0.0.0/18"
    availability_zone = "us-east-1a"
}
 
resource "aws_subnet" "private_subnet"{
    vpc_id = aws_vpc.Demo_vpc.id
    cidr_block = "10.0.128.0/18"
    availability_zone = "us-east-1a"
}


resource "aws_internet_gateway" "demo_igw"{
    vpc_id = aws_vpc.Demo_vpc.id
}

resource "aws_route_table" "demo_route"{
    vpc_id = aws_vpc.Demo_vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.demo_igw.id
    }
}

resource "aws_route_table_association" "public_association"{
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.demo_route.id
}