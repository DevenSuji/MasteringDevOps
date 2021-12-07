# Create Before Destroy
    This life cycle policy will ensure that the file is created before the resource is destroyed.
```terraform:
resource "local_file" "pet" {
  filename    = "pet.txt"
  content = "I hate pets"

  lifecycle {
    create_before_destroy = true 
  }
}
```

# Prevent Destroy
    This life cycle prevents the resource from being destroyed.

```terraform:
resource "local_file" "pet" {
  filename    = "pet.txt"
  content = "I hate pets"

  lifecycle {
    prevent_destroy = true 
  }
}
```

# Ignore Changes
    This life cycle rule will prevent the resources from being updated based of the list of attributes that we define on the life cycle block.

```terraform:
resource "aws_instance" "webserver" {
  ami           = "ami-21f78e11" # Ubuntu Server 14.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  tags = {
    Name    = "ProjectA-Webserver"
  }
  lifecycle {
    ignore_changes = [tags]
  }
}
```

| Order | Option |    Explanation    | 
|:------|:-------|:-------| 
| 1 | create_before_destroy | Create the resource first and then destroy |
| 2 | prevent_destroy  | Prevents destroy of a resource |
| 3 | ignore_changes | Ignore changes to resource attributes (specific/all) |