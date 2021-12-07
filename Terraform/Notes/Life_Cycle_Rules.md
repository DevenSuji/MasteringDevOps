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
