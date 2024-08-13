terraform {
  backend "s3" {
    bucket  = "php-legacy-cron-csr2"
    region  = "us-east-1"
    key     = "lambda/terraform.tfstate"
    encrypt = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = "~> 5.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}