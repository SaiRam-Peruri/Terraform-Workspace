#!/bin/bash
set -e
cd terraform

echo "Importing existing DynamoDB tables..."
for table in Users Videos Translations Logs Transcriptions; do
  if aws dynamodb describe-table --table-name "$table" &>/dev/null; then
    terraform import aws_dynamodb_table.${table,,} "$table" || true
  fi
done

echo "Importing API Gateway..."
API_ID=$(aws apigateway get-rest-apis --query "items[?name=='TranscriptionAPI'] | sort_by(@, &createdDate) | [-1].id" --output text)
if [ -n "$API_ID" ] && [ "$API_ID" != "None" ]; then
  terraform import aws_api_gateway_rest_api.transcription_api "$API_ID" || true
  RESOURCE_ID=$(aws apigateway get-resources --rest-api-id "$API_ID" --query "items[?pathPart=='transcriptions'].id" --output text)
  terraform import aws_api_gateway_resource.transcription_resource "$API_ID/$RESOURCE_ID" || true
  terraform import aws_api_gateway_method.get_transcription "$API_ID/$RESOURCE_ID/GET" || true
  terraform import aws_api_gateway_method.update_transcription "$API_ID/$RESOURCE_ID/PUT" || true
fi

echo "Importing Lambda..."
if aws lambda get-function --function-name TranscriptionHandler &>/dev/null; then
  terraform import aws_lambda_function.transcription_lambda TranscriptionHandler || true
  terraform import aws_lambda_permission.api_gateway_invoke_get TranscriptionHandler/AllowAPIGatewayInvokeGet || true
  terraform import aws_lambda_permission.api_gateway_invoke_put TranscriptionHandler/AllowAPIGatewayInvokePut || true
fi

echo "Importing S3 bucket..."
if aws s3api head-bucket --bucket vubber-terraform-artifacts 2>/dev/null; then
  terraform import aws_s3_bucket.terraform_artifacts vubber-terraform-artifacts || true
fi
