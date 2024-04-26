# AWS S3 Backup Script

This Python script provides a way to back up an Amazon S3 bucket using the AWS Backup service. It checks if bucket versioning is enabled, and if not, it can enable versioning automatically. The script also creates a backup plan and associates the S3 bucket with the backup plan.

## Prerequisites

- Python 3.x
- The `boto3` library (you can install it using `pip install boto3`)
- An AWS account with appropriate permissions to manage S3 buckets and backup plans
- AWS IAM role with permissions to manage S3 buckets and backups

## Configuration

To set up and configure the script:

1. **AWS Credentials**: Ensure you have your AWS access key ID and secret access key. You can set them up in environment variables or through an AWS credentials file.

2. **Environment Variables**:
    - Set `AWS_ACCESS_KEY_ID` to your AWS access key ID.
    - Set `AWS_ACCESS_KEY` to your AWS secret access key.
    - Optional: Set `AWS_REGION` to specify the region where your S3 bucket and backup plan will be managed. Default is `ap-south-1`.

3. **IAM Role**: Create an IAM role with permissions to manage S3 buckets and backups. You need to provide the ARN of this role in the script (`role_arn`).

4. **Bucket and Plan Names**:
    - Set `bucket_arn` to the ARN of the S3 bucket you want to back up.
    - Set `bucket_name` to the name of the S3 bucket you want to back up.
    - Set `plan_name` to a name for your backup plan.
    - Optional: Update `account_id` with your AWS account ID.

5. **Backup Rule**:
    - The script uses a default backup rule that backs up daily at midnight UTC.
    - You can modify the `backup_rule` variable in the script to specify different backup schedules and lifecycle policies.

## Usage

1. **Clone the Repository**: Clone the repository containing the script or save the script as a Python file (`script.py`).

2. **Install Dependencies**: Install the `boto3` library using the following command:

    ```shell
    pip install boto3
    ```

3. **Run the Script**: Run the script using Python:

    ```shell
    python3 script.py
    ```

The script will perform the following steps:

- Check if versioning is enabled on the specified S3 bucket.
- If versioning is not enabled and `enable_versioning` is set to True, it will enable versioning on the bucket.
- Create a backup plan according to the provided plan name and backup rule.
- Associate the specified S3 bucket with the backup plan.

## Notes

- Ensure you have the necessary permissions to manage S3 buckets and backup plans in your AWS account.
- Modify the script as needed for your specific backup requirements, such as changing the backup rule schedule or lifecycle policies.

