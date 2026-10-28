##going to define subnets in two different AZs

variable "subnet" {
  type = map(object(
    {
      cidr = string
      az   = string
    }

  ))

  default = {
    public_subnet = {
      cidr = "10.0.1.0/24"
      az   = "us-east-1a"
    }
    private_subnet = {
      cidr = "10.0.2.0/24"
      az   = "us-east-1b"
    }
  }
}