resource "local_file" "pet" {
  filename    = "pet.txt"
  content = "I hate pets"

  lifecycle {
    prevent_destroy = true # This life cycle prevents the resource from being destroyed
  }
}
