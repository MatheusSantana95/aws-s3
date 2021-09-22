terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {  
  access_key = var.AWS_Access_Key
  secret_key = var.AWS_Secret_Key
  region  = var.AWS_Region
}

resource "aws_s3_bucket" "first_s3" {
  bucket = "matheuss3"
  ac1    = "private"


  tags = {
    owner = "MatheusSantana95"
    project = "s3Test"
  }
}
