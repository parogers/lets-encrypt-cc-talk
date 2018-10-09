#!/bin/bash

HOST=$1

if [ "$HOST" = "" ]; then
    echo "usage: $0 host"
    exit
fi

true | openssl s_client -showcerts -connect $HOST:443 -servername $HOST 2> /dev/null | sed -n -e '/BEGIN\ CERTIFICATE/,/END\ CERTIFICATE/ p'

