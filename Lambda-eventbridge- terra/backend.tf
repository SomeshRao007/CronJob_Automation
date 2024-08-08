terraform {
  backend "s3" {
    bucket  = "php-legacy-cron-csr"
    region  = "ap-south-1"
    key     = "php-legacy-cron-csr/lambda/terraform.tfstate"
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