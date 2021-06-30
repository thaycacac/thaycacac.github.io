---
layout: page
title: Deploy
subtitle: Lavaral - Nuxt
keyword: ["deploy", "deploy nuxtjs", "deploy laravel", "deploy wordpress", "thaycacac"]
---

## Deploy backend

Update

```ssh
sudo apt-get update -y
sudo apt-get upgrade -y
```

Install git, nodejs, curl, yarn

```ssh
sudo apt-get install git nodejs npm curl
npm install -g yarn
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
```

Check version

```ssh
git --version
nodejs --version
yarn --version
```

Install php,...

```ssh
sudo apt-get install php7.2 php7.2-fpm php7.2-mysql php7.2-curl php7.2-gd php7.2-mbstring php7.2-xml php7.2-xmlrpc php-zip
```

Install composer

```ssh
sudo apt install composer
```

Install database

```ssh
// ---------MYSQL----------
sudo apt install mysql-client-core-5.7
sudo apt install mysql-server
sudo systemctl status mysql
```

Install project

```ssh
sudo mkdir /var/www
git clone https://github.com/thaycacac.git
cd thaycacac
composer install
yarn
```

Create database

```sql
mysql -u root -p
CREATE DATABASE thaycacac DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL ON thaycacac.* TO 'thaycacacuser'@'localhost' IDENTIFIED BY '123456';
use thaycacac;
source data.sql;
```

Config file `.env`

```ssh
touch .env
nano .env
```

```ssh
DB_HOST=127.0.0.1
DB_NAME=thaycacac
DB_USER=thaycacacuser
DB_PASSWORD=123456
```

Install web server (Caddy)

```ssh
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/cfg/gpg/gpg.155B6D79CA56EA34.key' | sudo apt-key add -
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/cfg/setup/config.deb.txt?distro=debian&version=any-version' | sudo tee -a /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy@2.3.0

sudo chmod 777 /var/www/html/.../public/uploads/...
```

- Config web server

```ssh
thay.edu.vn:8080 {
  root * /var/www/thay.edu.vn.back/public
  php_fastcgi unix//run/php/php7.2-fpm.sock
  encode gzip
  file_server
}

thay.edu.vn {
  tls thaycacac@gmail.com
  encode gzip
  reverse_proxy localhost:7985
}
```

Restart web server

```ssh
sudo systemctl restart caddy
```

## Deploy nuxt

Install yarn,git,...and build project

````ssh
yarn build
yarn start
```

Install pm2

```ssh
npm install pm2 -g
pm2 start yarn -- start
````

Export sql

```sql
mysql -u root
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
mysqldump -u root -p thaycacac > data.sql
```

## CI/CD

Gen SSH Key

```ssh
mkdir -p $HOME/.ssh
chmod 0700 $HOME/.ssh
ssh-keygen
vim /root/.ssh/id_rsa.pub
```

[Add SSH Key](https://github.com/settings/keys)

Set repo: 

```ssh
git remote set-url origin git@github.com:
```

CD Frontend

```ssh
name: CD
on:
  push:
    branches:
      - production
      - master
      - main
  schedule:
    - cron: '* 6 * * *'

jobs:
  ci-test:
    runs-on: ubuntu-18.04
    strategy:
      matrix:
        node-version: [14.x]
    steps:
    - uses: actions/checkout@v2

    - name: Deploy
      uses: appleboy/ssh-action@master
      with:
        host: ${{ secrets.HOST }}
        password: ${{ secrets.PASSWORD }}
        username: root
        script: cd /var/www/stech.edu.vn
          && git pull
          && yarn
          && yarn build
          && pm2 restart yarn
```


