# Lambda Function for Transcription Handling v2
resource "aws_lambda_function" "transcription_lambda_v2" {
  function_name = "TranscriptionHandler_v2"
  role          = "arn:aws:iam::207567776087:role/LambdaExecutionRole"
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"

  filename         = "${path.module}/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda_function.zip")

  memory_size = 512
  timeout     = 30

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.transcriptions.name
    }
  }
}