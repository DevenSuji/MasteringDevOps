# Variables

## Passing the variables

## 1. Interactive Mode
    Look at the files main.tf and variables.tf.
    If we supply the variables in this manner then during the execution the console will prompt us to type the value 
    of the variable in an interactive mode.

```terraform:
resource "local_file" "pet" {
  filename = var.filename
  content  = var.content
}
resource "random_pet" "my-pet" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}
```

```terraform:
variable "filename" {
}
variable "content" {
}
variable "prefix" {
}
variable "separator" {
}
variable "length" {
}
```

## 2. Command Line Flags
    When calling terraform apply, we can pass on the arguments for the variable as shown below.
```terraform:
terraform apply -var "filename=/root/pets.txt" -var "content=We love pets" -var "prefix=Mrs" -var "seperator=." -var "length=2"
```

## 3. Environment Variables
    The values of the variables can be passed using the Environment Variables as well as shown below.
```terraform:
export TF_VAR_filename="/root/pets.txt"
export TF_VAR_content="We love pets"
export TF_VAR_prefix="Mrs"
export TF_VAR_seperator="."
export TF_VAR_length="2"
terraform apply
```
