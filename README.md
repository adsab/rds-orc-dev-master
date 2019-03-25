# AWS RDS - Oracle

## Summary
This is a sample stack  to create a Oracle RDS instance with dev appropriate sizing and configuration. 

## Getting started
To get started, clone the repository and change the directory names under each test* directory to your environment/name. Please note that creating RDS instances can take approximately 10-15 minutes to complete.

```
cp -pr test/dev1 test/dev2
```
## Developing
You'll need to change the following in the terraform.tfvars file for each environment . The file contains environment-specific variables that will get called during execution time.

* Tags
 - product_code_tag 
 - inventory_code_tag
 - environment_tag
 - product_name
 - resource_creator

* Variables

 - vrds_identifier (the name of the RDS instance, if omitted, Terraform will assign a random, unique identifier)
 - rds_engine_version (the engine version to use)
 - vrds_ro_count (number of read only instances to create)
 - vrds_instance_class (RDS instance class - computation and memory capacity of your instances)
 - vrds_multi_az (whether or not to create Multi-AZ instances)
 - alarm_sns_topic (a valid SNS Topic to send RDS Event alerts to)
 - cw_alarms (choose whether to receive alarms from CloudWatch)


## Planning
After the above tags and variable values have been changed, you can run <strong>terraform plan</strong> to see what Terraform intends to create.

```
terraform plan  -var-file=./test/dev1/terraform.tfvars
```

This will check against your .tfstate file to see both what exists and what will be created. If any of the items specified in the configuration do not exist you'll see a report of what Terraform intends to create.

## Deploying / Publishing
If the output of <strong>terraformer plan</strong> looks acceptable you can run the <strong>terraform apply</strong> command to actually create the listed resources in AWS.

```
terraform  apply -var-file=./test/dev1/terraform.tfvars 
```

## Destroying

If you wish to destroy your RDS resources in AWS, run <strong>terraform destroy</strong>.

```
terraform  destroy -var-file=./test/dev1/terraform.tfvars
```

## Terraform Outputs

  * CNAME for each instance, whether it's the writeable master instance, or the read-only instances.

## Database Parameters
  * Avoid hard coding size related parameters. RDS provides default settings based on the instance type.
  * For addtional cluster and/or instance parameters that need customized values, add to parameters.tf

## Appendix

-- aws syntax for rds

http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html

http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html


-- terraform syntax

https://www.terraform.io/docs/providers/aws/r/db_instance.html


