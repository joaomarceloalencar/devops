terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
#  backend "s3" {
#    bucket = "kubernetes20241207"
#    key    = "state"
#    region = "us-east-1"
#  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}
