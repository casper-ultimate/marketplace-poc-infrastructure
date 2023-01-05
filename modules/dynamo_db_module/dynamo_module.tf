locals {
  vpc_1       = "vpc-8ba3-c183cab301fe" #use var
  environment = "mock"                  #user var
  dynamo_instance_name = "${local.vpc_1}-dynamo"
}

module "dynamo_instance_item" {
  source = "..//dynamo_db"

  name        = local.dynamo_instance_name
  environment = local.environment
}

#make a default dynamo_db component
#make custom dynamo_db components which are specific dynamo_db implementations