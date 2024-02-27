module "docker-nginx" {
    source = "./module/docker-nginx"

    container_name      = "nginx-app"
    container_image     = "nginx:latest"
    containers_number   = 3
    int_port            = 80
    ext_port            = 3000
    container_volume    = "nginx-app_data"
    container_memory    = 256
    container_privileged = false
    healthcheck_command = ["CMD", "curl", "-f", "localhost"]
}