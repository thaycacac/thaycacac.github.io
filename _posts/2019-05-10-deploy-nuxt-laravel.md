---
layout: post
title: SEO Checklist
subtitle: Deploy Nuxt - Laravel
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [follow]
categories: [share]
tags: [seo]
description:
keywords: []
---

#### Deploy laravel

Cài đặt git:

```ssh
apt-get update
apt-get install git-core
git -v
```

Cài đặt nodejs, npm, yarn

```ssh
sudo apt install nodejs
sudo apt install npm
nodejs -v
sudo port install yarn
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
sudo apt install curl php-cli php-mbstring git unzip
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
```

Vào trang [này](https://composer.github.io/pubkeys.html) rồi copy vào SSH như thế này

```ssh
HASH=544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer
```

Vào project và chạy

```ssh
composer install
```

Tạo databse

```sql
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

Sửa file sau `/ect/nginx/sites/availble/default` thêm index.php
