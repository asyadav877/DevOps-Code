# Terraform Modules Usage

This guide provides instructions on how to create resources using Terraform modules.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) installed on your local machine.
- AWS credentials set up in your environment (e.g., `~/.aws/credentials` or environment variables).

## Usage

1. **Initialize the Terraform Project**:

    In the root directory of your Terraform project, run the following command to initialize the Terraform working directory and configure the backend:

    ```shell
    terraform init
    ```

2. **Plan the Changes**:

    Run the following command to see what resources Terraform will create or modify based on your configuration:

    ```shell
    terraform plan
    ```

    This command will output a preview of the changes that will be applied.

3. **Apply the Changes**:

    If you are satisfied with the plan and want to create the resources, run the following command:

    ```shell
    terraform apply
    ```

    Terraform will apply the planned changes and create or modify the resources.

4. **Destroy the Resources** (Optional):

    When you no longer need the resources, run the following command to destroy them and clean up:

    ```shell
    terraform destroy
    ```

    This will remove all resources created by the Terraform configuration.

## Potential Costs

- **Resource Costs**: The resources created by Terraform, such as EC2 instances, S3 buckets, or Elastic IPs, may incur costs.
- **Usage Monitoring**: Monitor your usage and costs in the AWS Management Console.

## Notes

- **Manage State**: Ensure that your Terraform state file is managed securely (e.g., using an S3 bucket).
- **Plan and Apply**: Review the output of `terraform plan` before running `terraform apply` to avoid unexpected changes.

## Example Usage

Refer to the example usage in the provided modules for more details on specific Terraform configurations.
