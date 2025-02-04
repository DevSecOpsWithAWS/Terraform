terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "sridevsecops-terraform-remote-state"
    key = "Workspace demo"
    region = "us-east-1"
    dynamodb_table = "Terraform-State-Locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}