#!/bin/bash

FILE="/var/www/environment/docker/build/mysql-8/log/error.log"
if ! [ -f $FILE ]; then
    touch $FILE
    chmod 0666 $FILE
    echo the file $FILE was created
fi