/* I had a lot of problems with this DynamoDB - TF required fields that are not required in console
and that are not listed as required in the TF documentation
it failed TF apply when I did not specify a range_key - but I don't want a range key!
it required that all attributes have indexes
*/

resource "aws_dynamodb_table" "dynamodb-table2" {
  name           = "BachKeyboardSuites2"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "BWV"
  range_key      = "MovementNum"

  attribute {
    name = "BWV"
    type = "S"
  }

  attribute {
    name = "Title"
    type = "S"
  }

  attribute {
    name = "Key"
    type = "S"
  }

  attribute {
    name = "MovementNum"
    type = "N"
  }

## TF says that all attributes must be indexed
# these could changed to be global instead of local, which means they are global to dyanmoDB, not global geographically!

  local_secondary_index {
    name               = "TitleIndex"
    range_key          = "Title"
    projection_type    = "KEYS_ONLY"
  }

  local_secondary_index {
    name               = "KeyIndex"
    range_key          = "Key"
    projection_type    = "KEYS_ONLY"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags {
    Name        = "dynamodb"
    Environment = "sbx"
  }
}
