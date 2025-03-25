terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    # These key and value pairs are passed with -backend-config
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "the-bucket-name"
}