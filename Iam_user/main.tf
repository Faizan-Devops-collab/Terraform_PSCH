resource "aws_iam_user" "users" {

  #user for each loop to get the names 
  for_each = { for user in local.users : user.first_name => user }

  #to create a name in format FA Azeez
  name = "${substr(each.value.first_name, 0, 1)} ${each.value.last_name}"

 tags = {
    "Department" = each.value.department
    "job_title" = each.value.job_title
 }
}

#now to create a user login profile
#Login profiles are created for console access with password reset required:
#make user you do password reset when you login, set true

resource "aws_iam_user_login_profile" "user" {
  user    = aws_iam_user.users
  password_reset_required = true
}

# to delete existing users
#aws iam delete-login-profile --user-name mscott
#aws iam delete-user --user-name mscott