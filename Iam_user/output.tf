# to generate the output name and check if we can use that for loop

output "user_name" {
  value = [for user in local.users : "$(user.first_name) $(user.last_name)"]
}