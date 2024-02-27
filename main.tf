terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

variable "image" {
  description = "Docker image to use"
  type = string
}

variable "memory" {
  description = "Container memory"
  type = string
  default = "512m"
}

variable "privileged" {
  description = "Whether the container should be privileged or not"
  type = boolean
  default = true
}

variable "num_containers" {
  description = "Number of containers to spawn"
  type = number
  default = 1
}

variable "start_port" {
  description = "Starting port number"
  type = number
  default = 3000
}


provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "nginx" {
  image = var.image
  name  = "nginx_${count.index}"
  count = var.num_containers

  ports {
    internal = 80
    external = var.start_port + count.index
  }

  env {
    NGINX_HOSTNAME = "${docker_container.nginx.name}"
  }

  volume {
    host_path      = "/opt/terraform/terraform-docker-module/index.html"
    container_path = "/usr/share/nginx/html/index.html"
  }
}
