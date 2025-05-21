# DynamoDB Table: Users
resource "aws_dynamodb_table" "users" {
  name           = "Users_v2"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "Email"
    type = "S"
  }

  attribute {
    name = "CreatedAt"
    type = "S"
  }

  global_secondary_index {
    name            = "EmailIndex"
    hash_key        = "Email"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  global_secondary_index {
    name            = "CreatedAtIndex"
    hash_key        = "CreatedAt"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  # lifecycle {
  #   prevent_destroy = true
  #   ignore_changes  = [read_capacity, write_capacity, billing_mode]
  # }
}

# DynamoDB Table: Videos
resource "aws_dynamodb_table" "videos" {
  name           = "Videos_v2"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "VideoId"

  attribute {
    name = "VideoId"
    type = "S"
  }

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "CreatedAt"
    type = "S"
  }

  global_secondary_index {
    name            = "UserIdIndex"
    hash_key        = "UserId"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  global_secondary_index {
    name            = "CreatedAtIndex"
    hash_key        = "CreatedAt"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  # lifecycle {
  #   prevent_destroy = true
  #   ignore_changes  = [read_capacity, write_capacity, billing_mode]
  # }
}

# DynamoDB Table: Translations
resource "aws_dynamodb_table" "translations" {
  name           = "Translations_v2"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "VideoId"
  range_key      = "TargetLanguage"

  attribute {
    name = "VideoId"
    type = "S"
  }

  attribute {
    name = "TargetLanguage"
    type = "S"
  }

  global_secondary_index {
    name            = "TargetLanguageIndex"
    hash_key        = "TargetLanguage"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  # lifecycle {
  #   prevent_destroy = true
  #   ignore_changes  = [read_capacity, write_capacity, billing_mode]
  # }
}

# DynamoDB Table: Logs
resource "aws_dynamodb_table" "logs" {
  name           = "Logs_v2"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LogId"

  attribute {
    name = "LogId"
    type = "S"
  }

  attribute {
    name = "VideoId"
    type = "S"
  }

  attribute {
    name = "Timestamp"
    type = "S"
  }

  global_secondary_index {
    name            = "TimestampIndex"
    hash_key        = "Timestamp"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  global_secondary_index {
    name            = "VideoIdIndex"
    hash_key        = "VideoId"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  # lifecycle {
  #   prevent_destroy = true
  #   ignore_changes  = [read_capacity, write_capacity, billing_mode]
  # }
}

# DynamoDB Table: Transcriptions
resource "aws_dynamodb_table" "transcriptions" {
  name           = "Transcriptions_v2"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "transcription_id"
  range_key      = "video_id"

  attribute {
    name = "transcription_id"
    type = "S"
  }

  attribute {
    name = "video_id"
    type = "S"
  }

  global_secondary_index {
    name            = "VideoIndex"
    hash_key        = "video_id"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  # lifecycle {
  #   prevent_destroy = true
  #   ignore_changes  = [read_capacity, write_capacity, billing_mode]
  # }
}



