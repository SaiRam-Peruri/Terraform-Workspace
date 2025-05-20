import json
import boto3
import os
from boto3.dynamodb.conditions import Key

# Initialize DynamoDB Client
dynamodb = boto3.resource("dynamodb")
TABLE_NAME = os.environ["TABLE_NAME"]
table = dynamodb.Table(TABLE_NAME)

def lambda_handler(event, context):
    """
    Handles API Gateway requests for:
    - GET: Retrieve transcription
    - PUT: Update transcription
    """

    http_method = event["httpMethod"]

    if http_method == "GET":
        return get_transcription(event)
    elif http_method == "PUT":
        return update_transcription(event)
    else:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": "Invalid request method."}),
        }


def get_transcription(event):
    """
    Retrieves a transcription from DynamoDB based on transcription_id.
    """
    transcription_id = event["queryStringParameters"].get("transcription_id")

    if not transcription_id:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": "Missing transcription_id parameter."}),
        }

    response = table.get_item(Key={"transcription_id": transcription_id})

    if "Item" not in response:
        return {
            "statusCode": 404,
            "body": json.dumps({"error": "Transcription not found."}),
        }

    return {
        "statusCode": 200,
        "body": json.dumps(response["Item"]),
    }


def update_transcription(event):
    """
    Updates an existing transcription entry in DynamoDB.
    """
    try:
        body = json.loads(event["body"])
        transcription_id = body.get("transcription_id")
        updated_text = body.get("segments")

        if not transcription_id or not updated_text:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "Missing required fields."}),
            }

        response = table.update_item(
            Key={"transcription_id": transcription_id},
            UpdateExpression="SET segments = :segments",
            ExpressionAttributeValues={":segments": updated_text},
            ReturnValues="UPDATED_NEW",
        )

        return {
            "statusCode": 200,
            "body": json.dumps({"message": "Transcription updated successfully.", "updated": response["Attributes"]}),
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)}),
        }
