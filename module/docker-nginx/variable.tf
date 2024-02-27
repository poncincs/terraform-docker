variable "container_name" {
  description = "Name of the container."
  type        = string
  default     = "web-app"
}

variable "container_image" {
  description = "Image of the container."
  type        = string
  default     = "nginx"
  validation {
    condition     = can(regex("^nginx(:[a-zA-Z0-9-]+)?$", var.container_image))
    error_message = "Container image should be 'nginx' or 'nginx:tag' where tag is alphanumeric with hyphens allowed."
  }
}

variable "container_volume" {
  description = "Volume for container."
  type        = string
  default     = "web_data"
}

variable "container_memory" {
  description = "Allocated memory for container."
  type        = number
  default     = "256"
  validation {
    condition     = var.container_memory >= 64
    error_message = "Available memory for container should be higher than 64 MB."
  }
}

variable "container_privileged" {
  description = "Whether the container should be privileged or not"
  default = true
}

variable "containers_number" {
  description = "Number of containers to spawn"
  type = number
  default = 1
}

variable "int_port" {
  description = "Internal port for container."
  type        = number
  default     = "80"
  validation {
    condition     = var.int_port >= 1 && var.int_port <= 65534
    error_message = "Internal port should be between TCP/1-65534."
  }
}

variable "ext_port" {
  description = "External port to use as starting point for containers"
  type        = number
  default     = "3000"
  validation {
    condition     = var.ext_port >= 3000
    error_message = "External port should be higher than TCP/3000."
  }
}

variable "healthcheck_command" {
  description = "Healthcheck command"
  type        = list(string)
  default     = ["CMD", "curl", "-f", "localhost"]
}