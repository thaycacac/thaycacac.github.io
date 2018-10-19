---
layout: post
title: Docker Command- Note
subtitle: Note for me - docker
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [star, follow]
tags: [note for me, docker]
---
Docker là một open platform cung cấp cho người sử dụng những công cụ và service để người sử dụng có thể đóng gói và chạy chương trình của mình trên các môi trường khác nhau một cách nhanh nhất.

## Docker là gì và để làm gì?

Docker là một nền tảng để cung cấp cách để building, deploying và running ứng dụng một cách dễ dàng trên nền tảng ảo hóa. Có nhiều công nghệ Container khác như Solaris Zones, BSD jails, và LXC. Nhưng tại sao Docker lại phát triển, phổ biến nhanh chóng? Đây là những nguyên nhân: **Ease of use, Speed, DockerHub, Modularity and Scalability**.

Để cài đặt, bạn xem hướng dẫn tại đây: [Install Docker](https://www.docker.com/get-started) và thực hiện một số lệnh như sau để kiểm tra xem đã có trên máy chưa:

Kiểm tra version của docker

```
docker version
```
Thông tin về docker

```
docker info
```

Tạo thử một container

```
docker run hello-world
```

## Cài đặt docker.

## Sử dụng Docker container.

## Đóng gói Docker image

## Phối hợp Docker container bằng docker-compose

## Volume - Networking

## Docker swarm

```
docker run -it -rm alpine:latest /bin/ash
```
* Kiểm tra hệ điều hành `uname -a`
* List hard ware `lshw`
* Kiểm tra những gì đang chạy `top | htop`

Docker container, Docker images
```docker
docker pull alpine:latest
docker iamges
docker images | grep alpine
docker run -it --rm alpine:latest /bin/ash
```
Các lệnh căn bản:
* docker pull
* docker run
* docker ps, docker ps -a
* docker exec
* docker attach
* docker start
* docker stop

```docker
docker run --rm hello-world
docker run -it --rm alpine:latest
docker run --name web -p 80:80 nginx:alpine
```
giới thiệu exec, logs
```docker
docker exec -it web /bin/ash
```

Image
```
docker history image_id
```
Kiểm tra sự thay đổi: 
```docker
docker diff image
```
Run nginx:
```docker
curl http://localhost:80/
```
Ánh xạ: 
```docker
docker run --name web -p 80:80 \
-v /Users/cuong/Downloads/blog:/usr/share/nginx/html\
nginx:alpine
```

Tạo image
```docker
docker commit -a 'thaycacac' -m 'new image' al thaycacac/alpinenew:v1
```

Test bash script 
```docker
vi setup.sh
#! /bin/sh
apk update
apk upgrade
apk add tree htop curl
vi setup.sh
cat setup.sh
chmod +x setup.sh
./setup.sh
```

