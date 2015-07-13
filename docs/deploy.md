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

## 数据说明
'0.01 (1): SELECT shorten FROM url WHERE expand = 'http://4instructor.com/''
0.05 (2): INSERT INTO url (shorten, expand) VALUES ('', 'http://4instructor.com/')
0.01 (3): SELECT last_insert_id();
0.02 (4): UPDATE url SET shorten = 'eRASX' WHERE id=1L
0.0 (1): SELECT expand FROM url WHERE shorten = 'eRASX'
0.0 (1): SELECT shorten FROM url WHERE expand = 'http://it.ccnu.edu.cn/teacherdetail/index/57.html'
0.0 (2): INSERT INTO url (shorten, expand) VALUES ('', 'http://it.ccnu.edu.cn/teacherdetail/index/57.html')
0.0 (3): SELECT last_insert_id();
0.0 (4): UPDATE url SET shorten = 'JH2Yn' WHERE id=2L

## thanks the author of shortURL 
在 /alidata/www/shorturl-conf/start.sh 中增加了两条命令：

export PYTHON_EGG_CACHE="`pwd`/.python-eggs"        # 当前系统读的是 /root/.python-eggs 目录，没有权限
export LD_LIBRARY_PATH=/alidata/server/mysql/lib/:$LD_LIBRARY_PATH   # 因为你不是通过 yum 安装的 mysql 所以找不到需要的 lib

错误信息在这里 /alidata/www/shorturl-conf/gunicorn_error.log
