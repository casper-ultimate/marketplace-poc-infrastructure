resource "aws_dynamodb_table" "dynamo-table" {
  name           = var.database_environment
  billing_mode   = "PAY_PER_REQUEST"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = var.database_name
    Environment = var.database_environment
  }
}