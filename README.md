# MasteringDevOps
All the DevOps Learning


terraform init:

terraform plan:

terraform apply:

terraform validate:

***<u>Workspaces</u>***

terraform workspace show: Shows the current workspace that we are working on.

terraform workspace new example : Creates a new workspace by the name example and switches to the newly created workspace.

terraform workspace list: Lists all the available workspaces.

terraform workspace select default: Switches the workspace to default

#### Dynamically selecting EC2 instaces based on workspace.  
  
The below code uses the instance t2.medium when working on the default workspace and t2.micro when working on any other workspace dynamically.
  
```terraform
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}
```