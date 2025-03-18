provider "docker" {}

resource "docker_image" "html_image" {
  name         = "html-server"
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "html_container" {
  name  = "html_container"
  image = docker_image.html_image.name
  ports {
    internal = 80
    external = 8084
  }
}
