#!/bin/bash
# Copying the SSH Keyto the server
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9TX2j2WwHYuKNfyIrBcZQy72ZxDWIjv4laKyTtAke4Q3Lf1RKS13kOqpG9jCGC4eJqoiPoDxhHztOjWTradjKKePhzV1Y3LJveYzm79q9gJv9HoCkkoYb1EuQfiK3BsAPLrlLwfMaVUQ0oOEA0AhkT72mOCKGEwFHGZxI1He4lvoFnNDO8OZKJuP499TsbGoIZKaO3zNM5+ELuMLHlfgpL2dKw2ycO/zDs70xwHV0pzwbcfHXFzxJJbY8AWHUHvErmQo1n2ZAuaBn4QQZvUd5gzXuKa1Pca4a/nBBg7yaaxpxT/Rz88U7ravvN1N8U3IJkkkoSR3rrcbgXqeBob/R nicolas.osorio@ip-10-0-0-100" >> /home/ubuntu/.ssh/authorized_keys

# Install docker
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce
usermod -aG docker ubuntu

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# READ MORE: https://docs.docker.com/install/linux/docker-ce/ubuntu/
# To check: grep "cloud-init\[" /var/log/syslog
#       OR: less /var/log/cloud-init-output.log

# Manually add user to docker group
sudo usermod -aG docker ubuntu
