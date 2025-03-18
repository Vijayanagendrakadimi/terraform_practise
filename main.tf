terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock" # For Linux/macOS
  # host = "npipe:////./pipe/docker_engine" # For Windows
}

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
