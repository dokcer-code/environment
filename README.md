~~~
sudo cp /var/www/environmentd.service /etc/systemd/system/
sudo systemctl daemon-reload
systemctl enable environmentd
service environmentd start
~~~