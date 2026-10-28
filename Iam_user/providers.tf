terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.56.0"
    }
  }
}

##to store the statefile in remote backened
##s3 bucket should already be there in order to store the state


