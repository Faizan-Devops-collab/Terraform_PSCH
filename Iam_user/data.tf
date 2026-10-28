
##to get the account on which these users are being created
data "aws_caller_identity" "name" {}

output "name" {
  value = data.aws_caller_identity.name
}