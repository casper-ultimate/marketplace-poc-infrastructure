#variables to set up the database to go with this api.
#server/ecs

#reference the variables in service_info.hcl

#use vars for this component to take in variables
terraform {
  source = "../..//modules/dynamo__db_module"

  name = "Some Name" #use var
  environment = "Some env" #use var
}

#terraform {
#  source = "../..//modules/ec2_instance"
#}