#!/bin/bash
# docker install and create regular user

# Update system
sudo yum update -y

# Install Docker
sudo yum install docker -y

# Add user to docker group for non-root access
sudo usermod -aG docker ec2-user

# Start Docker service and enable it to start on boot
sudo service docker start
sudo systemctl enable docker 

# Change terminal color for user ec2-user (set custom prompt color)
echo "PS1='\e[1;32m\u@\h \w$ \e[m'" >> /home/ec2-user/.bash_profile

# Install git
sudo yum install git -y

# Install wget
sudo yum install wget -y

# Install Docker Compose (version 2.x) using the Docker CLI plugin method
# Compose v2 comes with Docker and can be used as a plugin (docker compose)
DOCKER_COMPOSE_VERSION="v2.20.0" # Adjust the version if needed
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

# Make docker-compose executable
sudo chmod +x /usr/local/bin/docker-compose

# Enable Docker Compose v2 as a Docker CLI plugin (optional)
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Verify Docker Compose installation
docker compose version

# Print success message
echo "Docker, Docker Compose, Git, and Wget have been installed successfully!"
