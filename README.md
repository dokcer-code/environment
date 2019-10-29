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