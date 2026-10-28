terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.53.0"
    }
  }
}


resource "aws_s3_bucket" "example1" {
  bucket = "my-first-faizan-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "prod"
  }
}

