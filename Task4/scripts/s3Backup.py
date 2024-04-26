import boto3
import os

def check_bucket_versioning(client, bucket_name):
    try:
        response = client.get_bucket_versioning(Bucket=bucket_name)
    except Exception as e:
        print(f"Failed to get versioning configuration for bucket {bucket_name}: {e}")
        return False

    # Check the status of versioning
    status = response.get('Status')
    if status == 'Enabled':
        print(f"Bucket versioning is enabled for bucket: {bucket_name}")
        return True
    else:
        print(f"Bucket versioning is not enabled for bucket: {bucket_name}. Please Enable s3 bucket versioning before proceeding to create s3 bakcup plan")
        return False
    
def enable_bucket_versioning(client, bucket_name):
    try:
        # Enable bucket versioning
        client.put_bucket_versioning(
            Bucket=bucket_name,
            VersioningConfiguration={
                'Status': 'Enabled' 
            }
        )
        print(f"Versioning has been enabled for bucket: {bucket_name}")
    except Exception as e:
        print(f"Failed to enable versioning for bucket {bucket_name}: {e}")

def create_backup_plan(client, plan_name, rule, role):
    # Define the backup plan
    backup_plan = {
        'BackupPlanName': plan_name,
        'Rules': [ rule ]
    }
    # Create the backup plan
    response = client.create_backup_plan(BackupPlan=backup_plan)
    plan_id = response['BackupPlanId']
    print(f'Backup plan created with ID: {plan_id}')
    return plan_id

def associate_s3_bucket_to_backup_plan(client, plan_id, bucket_arn, role_arn):
    # Define the resource assignment
    resource_assignment = {
        'ResourceType': 'S3',
        'ResourceName': bucket_arn,
    }

    # Associate the S3 bucket with the backup plan
    response = client.create_backup_selection(
        BackupPlanId=plan_id,
        BackupSelection={
            'SelectionName': 'S3BucketBackup',
            'IamRoleArn': role_arn,  # Use the appropriate IAM role ARN
            'Resources': [bucket_arn],
        }
    )
    print(f'Successfully associated S3 bucket {bucket_arn} with backup plan ID: {plan_id}')

def main():
    
    #Fetching env variables
    aws_region = os.environ.get('AWS_REGION','ap-south-1')
    AWS_ACCESS_KEY_ID = os.environ.get('AWS_ACCESS_KEY_ID','ap-south-1')
    AWS_ACCESS_KEY = os.environ.get('AWS_ACCESS_KEY','ap-south-1')
    
    #Boto3 Session
    session = boto3.Session(
        aws_access_key_id=access_key_id,
        aws_secret_access_key=secret_access_key,
        region_name=aws_region
    )
    
    #Fetching region
    aws_region = os.environ.get('AWS_REGION','ap-south-1')
    
    #Boto3 Client
    s3_client = session.client('s3', region_name=aws_region)
    backup_client = session.client('backup', region_name=aws_region)
    
    # S3 bucket ARN, Bucket Name and Backup Plan Name
    
    bucket_arn = 'arn:aws:s3:::learn-state-file-bucket'
    plan_name = 'S3BucketBackupPlan'
    bucket_name = 'learn-state-file-bucket'
    account_id = '212343243252423'
    role_arn = f'arn:aws:iam::{account_id}:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup' 
    enable_versioning = True # True to automatically enable bucket versioning if not enabled
    
    #Change rule config here according to your backup requirements
    backup_rule = {
                'RuleName': 'S3DailyBackupRule',
                'TargetBackupVaultName': 'Default',
                'ScheduleExpression': 'cron(0 0 * * ? *)',  # Daily at midnight UTC
                'Lifecycle': {
                    'MoveToColdStorageAfterDays': 30,
                    'DeleteAfterDays': 120
                }
            }

    #Check if Versioning is enabled on the bucket
    versioning_check = check_bucket_versioning(s3_client, bucket_name)
    
    if(not versioning_check):
        if(enable_versioning):
            enable_bucket_versioning(s3_client, bucket_name)
        else:
            return

    #Create a backup plan
    plan_id = create_backup_plan(backup_client, plan_name, backup_rule, role_arn)

    # Associate the S3 bucket with the backup plan
    associate_s3_bucket_to_backup_plan(backup_client, plan_id, bucket_arn, role_arn)


if __name__ == '__main__':
    main()
