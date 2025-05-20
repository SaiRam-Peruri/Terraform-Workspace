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
