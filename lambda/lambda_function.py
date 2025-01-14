import json
import boto3
import base64

s3_client = boto3.client('s3')
bucket_name = 'iot-stream-data'

def lambda_handler(event, context):
    for record in event['Records']:
        # Decode and process data
        payload = base64.b64decode(record['kinesis']['data']).decode('utf-8')
        data = json.loads(payload)
        
        # Save to S3
        file_key = f"processed-data/{data['timestamp']}.json"
        s3_client.put_object(
            Bucket=bucket_name,
            Key=file_key,
            Body=json.dumps(data),
            ContentType='application/json'
        )
        print(f"Data saved to S3: {file_key}")
    
    return {'statusCode': 200, 'body': 'Data processed and stored'}