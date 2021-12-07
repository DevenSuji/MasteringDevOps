resource "local_file" "pet" {
  filename    = "pet.txt"
  content = "I hate pets"

  lifecycle {
    create_before_destroy = true # This life cycle policy will ensure that the file is created before the resource is destroyed.
  }
}

