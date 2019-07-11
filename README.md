# Harmond Foundational Node
Deployment script for Harmony Foundational Node on AWS. Detailed Manual Setup Guide can be found [here](https://docs.google.com/document/d/1t4TCcvqu84YK5657ddOrezJc_Dn8GRiIwGMwPGlk6x8)

## Prerequisites
- Install [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
    - On MacOS with Homebrew, run: `brew install terraform`
- Have your AWS_ACCESS_KEYS with you.

## Deployment
Before deploying the instance, review `terraform/variables.tf` and adjust to your own configurations. The script will spin up an EC2 instance within a new VPC in your AWS account. To deploy, run:
```
./node-setup.sh 
```