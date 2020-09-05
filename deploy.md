---
layout: page
title: Deploy
subtitle: Lavaral - Nuxt
keyword: ["teky", "thaycacac"]
---

#### Deploy laravel

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
mysql -u root -p

// --------MARIADB---------
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo nano /etc/apt/sources.list.d/mariadb.list

# MariaDB 10.3 Repository
deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu bionic main
deb-src http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu bionic main

sudo apt install mariadb-server
sudo systemctl status mariadb
mariadb -u root -p
```

Create database

```sql
CREATE DATABASE thaycacac DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL ON thaycacac.* TO 'thaycacacuser'@'localhost' IDENTIFIED BY '123456';

```

Install project

```ssh
sudo mkdir /var/www
git clone https://github.com/thaycacac.git
cd thaycacac
composer install
yarn
```

Config file `.env`

```ssh
DB_HOST=127.0.0.1
DB_NAME=thaycacac
DB_USER=thaycacacuser
DB_PASSWORD=123456
```

Install web server

- Nginx

```ssh
// ---------NGINX---------
sudo apt install nginx

// ---------CADDY---------
echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" \
    | sudo tee -a /etc/apt/sources.list.d/caddy-fury.list
sudo apt update
sudo apt install caddy

sudo systemctl start caddy.service
sudo systemctl status caddy

sudo chmod 777 /var/www/html/.../public/uploads/...
```

- Config web server

```ssh
// ---------NGINX---------
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
// ssl
server {
  listen 8080 default_server;
  listen [::]:8080 default_server;
  root /var/www/backend/public;
  index index.php index.html index.htm index.nginx-debian.html;
  server_name _;
  location / {
    try_files $uri $uri/ index.php?$query_string;
  }
  location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
  }
}
server{
  listen 80;
  server_name thaycacac.com www.thaycacac.com;

  root /usr/share/nginx/html;

  index index.php index.html index.htm;
  location / {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
}

// ---------CADDY---------
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
// ---------NGINX---------
sudo service nginx restart

// ---------CADDY---------
sudo systemctl restart caddy.service
```

#### Deploy nuxt

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

If use network FPT

```ssh
sudo nano /etc/ssh/sshd_config
port 2222
service sshd reload
exit
```
