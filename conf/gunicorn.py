workers = 2
bind = 'unix:/tmp/shorturl.sock'
proc_name = 'shorturl'
pidfile = '/tmp/shorturl.pid'
user = 'www'
group = 'www'
errorlog = '/alidata/www/shorturl-conf/gunicorn_error.log'
