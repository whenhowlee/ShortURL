# Deployment

## clone code

    cd /alidata/www/
    git clone https://github.com/whenhowlee/ShortURL.git

## install dependencies

    pip install gunicorn
    pip install -r requirements.txt

## database

use shorturl/db.sql

## configure

    mkdir /alidata/www/shorturl-conf/
    cp -r conf/* /alidata/www/shorturl-conf/

### nginx

add `include /alidata/www/*-conf/nginx.conf;` to `http {...}` (`/etc/nginx/nginx.conf`)

change **server_name** (`/alidata/www/shorturl-conf/nginx.conf`)

    nginx -s reload

## run

    cd /alidata/www/shorturl-conf/
    chmod +x *.sh
* start
  `./start.sh`
* stop
  `./stop.sh`
* restart
  `./restart.sh`
* update code
  `./update.sh`
