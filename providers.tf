terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# provider "aws" {
#   #  region                   = "af-south-1"
#   # # shared_credentials_files = ["C:/Users/Lucy III/.aws/credentials"]
#   profile                  = "vscode"
# }