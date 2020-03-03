~~~
sudo cp /var/www/environmentd.service /etc/systemd/system/
sudo systemctl daemon-reload
systemctl enable environmentd
service environmentd start
~~~
# ssh

~/.ssh/config
~~~
Host 171.255.255.*
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
~~~

cli enable xdebug
~~~
-dxdebug.remote_host=171.255.255.1
~~~

delete nginx log
~~~
find docker/build/nginx/log/ -type f -not -name .gitignore -print0 | sudo xargs -0 rm --
~~~