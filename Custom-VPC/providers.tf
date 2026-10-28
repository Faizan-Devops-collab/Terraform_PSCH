##copy the code form AWS providers in Terraform Registry.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.56.0"
    }
  }

}