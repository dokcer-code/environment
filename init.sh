#!/bin/bash

FILE="/var/www/environment/docker/build/mysql-8/log/log.err"
if ! [ -f $FILE ]; then
    touch $FILE
    echo the file $FILE was created
fi