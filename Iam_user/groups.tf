# now create groups and add users to the group

resource "aws_iam_group" "Education" {

    name = "Education"
    path = "/groups/"
}

#adding users to the groups 
 resource "aws_iam_group_membership" "Education_members" {
  name = "Education-group-membership"
  group = aws_iam_group.Education.name

  #now to add the users to this group dynamically, we use for loop
  #for all users with department is added to this group
  #users is the aws_iam_user name in terraform

 users = [
    for user in values(aws_iam_user.users) :
     user.name if user.tags.Department == "Education"
 ]
 }

#attach polices to this group so that users can inherit
 resource "aws_iam_group_policy_attachment" "education_readonly" {
  group      = aws_iam_group.Education.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess" #inbuilt policy
}

