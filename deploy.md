---
layout: page
title: Deploy
subtitle: Lavaral - Nuxt
keyword: [
  'teky', 'thaycacac'
]
---

#### Deploy laravel

Update

```ssh
sudo apt-get update -y
sudo apt-get upgrade -y
```

Install git, nodejs,...

```ssh
sudo apt-get install git nodejs npm curl
git --version
nodejs --version
```

Install yarn

```ssh
sudo apt remove cmdtest
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get install --no-install-recommends yarn
yarn --version
```

Install php,...

```ssh
sudo apt-get install php7.2 php7.2-fpm php7.2-mysql php7.2-curl php7.2-gd php7.2-mbstring php7.2-xml php7.2-xmlrpc
```

Install composer

```ssh
sudo apt install
sudo apt install composer
```

Install database

- MySQL

```ssh
sudo apt install mysql-client-core-5.7
sudo apt install mysql-server
sudo systemctl status mysql
mysql -u root -p
```

- Mariadb

```ssh
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo nano /etc/apt/sources.list.d/mariadb.list
# MariaDB 10.3 Repository
deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu bionic main
deb-src http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu bionic main
sudo apt install mariadb-server
sudo systemctl status mariadb
```

Create database

```sql
CREATE DATABASE thaycacac DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL ON thaycacac.\* TO 'thaycacacuser'@'localhost' IDENTIFIED BY '123456';
```

Install project

```ssh
cd /var/www/html
git clone github.com/demo .
composer install
yarn
```

Setup file `.env`

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

Install web server

```ssh
sudo apt install nginx
nano /etc/nginx/sites-available
server {
  listen 80 default_server;
  listen [::]:80 default_server;
    root /var/www/html/public;
    index index.php index.html index.htm index.nginx-debian.html;
    server_name _;
    location / {
      try_files $uri $uri/ index.php?$query_string;
    }
    location ~ \.php$ {
      include snippets/fastcgi-php.conf;
      fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
      #fastcgi_pass 127.0.0.1:9000;
    }
  }
```

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
