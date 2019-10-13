---
layout: page
title: Deploy
subtitle: Lavaral - Nuxt
keyword: [
  'teky', 'thaycacac'
]
---

#### Deploy laravel

Cài đặt git:

```ssh
sudo apt-get update
sudo apt-get install git
git --version
```

Cài đặt nodejs, npm

```ssh
sudo apt install nodejs
sudo apt install npm
nodejs --version
```

Cài đặt yarn

```ssh
sudo apt remove cmdtest
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get install --no-install-recommends yarn
```

Cài đặt nginx

```ssh
sudo apt install nginx
```

Clone về `/var/www/html`

```ssh
git clone github.com/demo .
```

Cài đặt composer

```ssh
sudo apt install curl php-cli php-mbstring unzip
cd ~
sudo apt install composer
```

Vào project và chạy

```ssh
composer install
```

Tạo databse

```sql
sudo apt install mysql-client-core-5.7
sudo apt install mysql-server
mysql -u root -p
CREATE DATABASE thaycacacdb DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON thaycacacdb.* TO 'admin'@'localhost' IDENTIFIED BY '123456'
exit
```

Tạo file `.env` với nội dung như sau, sửa phần key bên dưới:

```ssh
WP_DEBUG=true
WP_THEME=wordplate
WP_PREFIX=wpl_

DB_HOST=127.0.0.1
DB_NAME=thaycacacdb
DB_USER=admin
DB_PASSWORD=123456

MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null

# Generate your keys here: https://wordplate.github.io/salt/
AUTH_KEY=
SECURE_AUTH_KEY=
LOGGED_IN_KEY=
NONCE_KEY=
AUTH_SALT=
SECURE_AUTH_SALT=
LOGGED_IN_SALT=
NONCE_SALT=
```

Sửa file sau `/ect/nginx/sites-availble/default` thêm index.php

```ssh
sudo service nginx restart
```

mariadb

sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

sudo vim /etc/apt/sources.list.d/mariadb.list

# MariaDB 10.3 Repository

deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu bionic main
deb-src http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu bionic main

sudo apt update
sudo apt install mariadb-server

//check
sudo systemctl status mariadb

mysql -u root -p

// PHP - Webserver
// PHP 7.2

sudo apt-get update
sudo apt-get install php7.2 php7.2-fpm php7.2-mysql php7.2-curl php7.2-gd php7.2-mbstring php7.2-xml php7.2-xmlrpc

mysql -u root -p

CREATE DATABASE laravel DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

GRANT ALL ON laravel.\* TO 'laraveluser'@'localhost' IDENTIFIED BY 'matkh@u';

sudo apt-get update && apt-get -y upgrade
sudo apt-get install curl

curl https://getcaddy.com | bash -s personal

wget -qO- https://getcaddy.com | bash -s personal
curl https://getcaddy.com | bash -s realip,expires,upload
sudo setcap cap_net_bind_service=+ep /usr/local/bin/caddy

sudo mkdir /etc/caddy

sudo chown -R root:www-data /etc/caddy

sudo mkdir /etc/ssl/caddy

sudo chown -R www-data:root /etc/ssl/caddy

sudo chmod 0770 /etc/ssl/caddy

sudo touch /etc/caddy/Caddyfile

sudo mkdir /var/www

sudo chown www-data: /var/www

sudo nano /lib/systemd/system/caddy.service
