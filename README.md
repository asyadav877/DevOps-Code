# DevOpsCode

## Table of Contents
1. [Infrastructure Code Using Terraform](#infrastructure-code-using-terraform)
2. [Kubernetes Deployment](#kubernetes-deployment)
3. [CI/CD Implementation using Github Actions](#cicd-implementation-using-github-actions)
4. [DevOps Automations](#devops-automations)

# Project Overview

This project includes various tasks that showcase skills in Infrastructure as Code (IaC), Kubernetes deployment, CI/CD with GitHub Actions, and DevOps automations.

## Task 1: Infrastructure as Code (IaC) with Terraform

This task involves managing the infrastructure using Terraform:

- **AWS VPC**: Created with two public and two private subnets for network segmentation and security.
- **EC2 Instance**: Provisioned in one private subnet to serve as a backend server.
- **Application Load Balancer (ALB)**: Configured in public subnet for load balancing and distributing traffic
- **S3 Bucket (S3)**: Create S3 Bucket using module
- **Terraform Usage**: Terraform is used to provision and manage the infrastructure, including VPC, subnets, EC2 instances, and ALB.

## Task 2: Kubernetes Deployment

In this task, a sample application (e.g., Nginx) is deployed on a Kubernetes cluster:

- **High Availability**: The application is configured for high availability using multiple replicas and appropriate resource management.
- **Rolling Updates**: Implemented for the application to ensure seamless upgrades with minimal downtime.

## Task 3: CI/CD with GitHub Actions

This task involves setting up a CI/CD pipeline using GitHub Actions:

- **Repository Setup**: A GitHub repository is created to host the sample application.
- **Build and Test Workflow**: A GitHub Actions workflow is set up to build and test the application on every push.
- **Deployment Workflow**: Automatically deploys the application to a staging environment when changes are pushed to the staging branch and the build workflow succeeds.

## Task 4: DevOps & Automation

This task covers various DevOps automations used in the project:

- **S3 Bucket Backup**: A script (bash, Python, or another preferred language) is written to automate the backup of an AWS S3 bucket.
- **Auto-Scaling EC2 Instances**: A process is implemented to automatically scale EC2 instances based on CPU utilization to ensure optimal resource usage and performance.

## Usage

To run the examples and code:

- **Terraform**: Initialize and apply Terraform code to create infrastructure resources.

    ```shell
    terraform init
    terraform plan
    terraform apply
    ```

- **Kubernetes**: Apply Kubernetes manifests to deploy the application and manage resources.

    ```shell
    kubectl apply -f deployment.yaml
    ```

- **CI/CD**: Push changes to the repository to trigger the GitHub Actions workflows.

- **DevOps Automations**: Run the scripts provided for automating S3 bucket backup and EC2 instance scaling.

## Notes

- Review each task's details in the corresponding sections and files for specific implementation and configuration.
- Monitor resource usage and costs for AWS services to avoid unexpected expenses.
