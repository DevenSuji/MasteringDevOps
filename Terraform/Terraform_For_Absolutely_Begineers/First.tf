resource "local_file" "pet" {
  filename    = "pet.txt"
  content = "This is the first terraform file that I've written"
}
