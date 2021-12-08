# Data Sources


There will be situations where need to use the data from the resources that are not provisioned by Terraform. In such situations
the data block can be used to import the data attributes from the data source that is not provisioned by TF.

In the below mentioned example dogs.txt file is the resource that is not provisioned by TF. Hence we'll try to import the content
of this file.

```terraform:
resource "local_file" "pet" {
  filename    = "/root/pets.txt"
  content = data.local_file.dog.content
}

data "local_file "dog" {
    filename = "/root/dog.txt"
}
```

## Difference between Resource and Data Source
| Resource | Data Source |  
|:---------|:---------|  
| Keyword: resource | Keyword: data |
| Creates, updates and destroyes infrastructure | Only READS Infrastructure |
| Also called Managed Resources | Also called Data Resources |