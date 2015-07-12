#!/bin/sh

cd ../ShortURL/

git pull

pip install -r requirements.txt

cd ../shorturl-conf/


chown www:www //www -R



./stop.sh
./start.sh
