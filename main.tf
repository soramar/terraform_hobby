provider aws {
    region = "ap-northeast-1"
}
resource "aws_instance" "tf_hobby_instanc" {
    tags = {
      Name = "tf-hobby-ec2"
    }
    ami = "ami-03a1b4db103179555"
    instance_type = "t2.micro"
}