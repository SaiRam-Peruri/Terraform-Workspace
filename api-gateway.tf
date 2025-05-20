# API Gateway for Transcription Service
resource "aws_api_gateway_rest_api" "transcription_api" {
  name        = "TranscriptionAPI"
  description = "API for retrieving and updating transcriptions"
}

resource "aws_api_gateway_resource" "transcription_resource" {
  rest_api_id = aws_api_gateway_rest_api.transcription_api.id
  parent_id   = aws_api_gateway_rest_api.transcription_api.root_resource_id
  path_part   = "transcriptions"
}

resource "aws_api_gateway_method" "get_transcription" {
  rest_api_id   = aws_api_gateway_rest_api.transcription_api.id
  resource_id   = aws_api_gateway_resource.transcription_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "update_transcription" {
  rest_api_id   = aws_api_gateway_rest_api.transcription_api.id
  resource_id   = aws_api_gateway_resource.transcription_resource.id
  http_method   = "PUT"
  authorization = "NONE"
}

# Permissions for API Gateway to Invoke Lambda
resource "aws_lambda_permission" "api_gateway_invoke_get" {
  statement_id  = "AllowAPIGatewayInvokeGet"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.transcription_lambda_v2.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_permission" "api_gateway_invoke_put" {
  statement_id  = "AllowAPIGatewayInvokePut"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.transcription_lambda_v2.function_name
  principal     = "apigateway.amazonaws.com"
}
