terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}


module "ec2" {
  source              = "./modules/ec2"
}


module "alb" {
  source             = "./modules/alb"
  
}

