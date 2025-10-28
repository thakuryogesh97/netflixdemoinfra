provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0a716d3f3b16d290c"
  instance_type          = "t3.small"
  key_name               = "mykey"
  vpc_security_group_ids = ["sg-051f0918b839aad06"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraform-demo-bucket-1234"
    versioning {
    enabled = true
  }

