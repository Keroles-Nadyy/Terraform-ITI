import boto3
import datetime
import os

ses_client = boto3.client('ses')

def lambda_handler(event, context):
    region = event['region']

    current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # Compose the email message
    subject = "New Terraform Deployment happens"
    body = f"A new deployment has occurred in workspace:, region: {region}, at: {current_time}"
    sender = os.environ['SES_SENDER_EMAIL']
    recipient = os.environ['SES_RECIPIENT_EMAIL']

    # Send the email
    response = ses_client.send_email(
        Source=sender,
        Destination={'ToAddresses': [recipient]},
        Message={'Subject': {'Data': subject}, 'Body': {'Text': {'Data': body}}}
    )

    return {
        'statusCode': 200,
        'body': response
    }
