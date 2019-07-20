# Harmony Foundational Node
Deployment script for Harmony Foundational Node on AWS. Detailed Manual Setup Guide can be found [here](https://docs.google.com/document/d/1t4TCcvqu84YK5657ddOrezJc_Dn8GRiIwGMwPGlk6x8)

## Prerequisites
- Install [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
    - On MacOS with Homebrew, run: `brew install terraform`
- Get your [AWS_ACCESS_KEYS](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html).
- Determine which [AWS Region](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html) you want to run your node instance.

## Deployment

To deploy, run:

```
./node-setup.sh launch
```
To shutdown a running instance:

```
./node-setup.sh shutdown
```