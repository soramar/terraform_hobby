resource "aws_subnet" "tfhobby_subnet" {
    vpc_id = aws_vpc.tfhobby_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1a"
    tags = {
        Name = "tfhobby_subnet"
    }
}

