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
