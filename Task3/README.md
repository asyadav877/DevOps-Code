# Express Server

This repository hosts an Express server application with automated workflows for continuous integration and deployment.

## Workflows

- **Build and Test Workflow**: Automatically builds and tests the code on every push.

- **Deployment Workflow**: Automatically deploys the application to the staging environment when there is a push to the `staging` branch and the build workflow succeeds.

## Repository

You can view the repository [here](https://github.com/asyadav877/express-server).

## Getting Started

1. Clone the repository:

    ```shell
    git clone https://github.com/asyadav877/express-server.git
    ```

2. Review the workflows in the `.github/workflows` directory.

3. Push changes to the repository to trigger the workflows.

4. Deployments to the staging environment will occur when there is a successful push to the `staging` branch.