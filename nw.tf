resource "aws_default_vpc" "default" {

    tags = {
      Name = "default vpc"
    }
}

resource "aws_default_subnet" "defsub" {
    availability_zone = "us-east-1a"
}
