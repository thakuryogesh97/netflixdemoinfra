provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-052064a798f08f0d3"
  instance_type          = "t2.medium"
  key_name               = "saleemkeyp"
  vpc_security_group_ids = ["sg-01ca5f009c7f3b4a0"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
