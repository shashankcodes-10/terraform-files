resource "aws_dynamodb_table" "db-table" {
  name = "db_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}