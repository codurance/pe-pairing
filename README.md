# PE-Pairing

This repository automates infrastructure deployment using Terraform through GitHub pull requests (PRs) for interview pairing exercises.

## Workflow
1. Create a branch and open a pull request (PR).
2. Terraform will automatically deploy the infrastructure on each push to the branch while the PR remains open.
3. Closing the PR will automatically destroy all deployed resources.

## IAM Permissions
The pipeline uses the IAM user `github-pe-pairing`, which currently has the following permissions:
- `AmazonDynamoDBFullAccess`
- `AmazonS3FullAccess`