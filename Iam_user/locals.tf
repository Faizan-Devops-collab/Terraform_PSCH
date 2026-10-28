##Convert the users.csv file to a list of maps, we use csvdecode()
##csvdecode decodes a string containing CSV-formatted data and produces a list of maps representing that data.
##created locals to decode the CSV file and pass the file

locals {
  users = csvdecode(file("users.csv"))

}