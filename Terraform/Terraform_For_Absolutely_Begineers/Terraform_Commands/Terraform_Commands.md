# Terraform Commands

## 1. terraform validate
    After running terraform init we can run terraform validate to confirm if the 
    configuration file that we wrote is valid or not.

## 2. terraform fmt
    This command formats the configuration file.

## 3. terraform show
    This command prints out the current state of the infrastructure as seen by terraform. 

## 4. terraform providers
    This command shows all the providers being used in the configuration directory.

## 5. terraform providers mirror /root/terraform/new_local_file
    This command will mirror the provider configuration to a new path 

## 6. terraform output
    This command will print out all the output variables in the configuration directory.

## 7. terraform output variable_name
    This command will print out the output variable value stored in variable_name.

## 8. terraform refresh
    This command is used to sync the terraform with the real world infrastructure.