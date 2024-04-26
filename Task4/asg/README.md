# ASG Terraform Module

This module launches an Auto Scaling Group (ASG) using Terraform.

## Configuration

- **Backend**: Configured to use S3 for state management.
- **Parameters**: Customize the ASG settings such as instance type, desired size, min/max sizes, and termination policies.
- **Outputs**: Returns the ASG name.

## Usage

1. Configure the Terraform backend and module parameters as needed.
2. Apply the configuration using Terraform to launch the ASG.

## Example
Refer to the example usage in the `module "asg"` block.

