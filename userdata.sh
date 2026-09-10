#!/bin/bash
apt update -y
apt install -y docker.io

systemctl enable docker
systemctl start docker

docker run -d --name web -p 80:80 nginx
