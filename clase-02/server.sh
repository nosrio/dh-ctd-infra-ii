#!/bin/bash
# simple bash webserver
# ref: https://dev.to/leandronsp/building-a-web-server-in-bash-part-i-sockets-2n8b

msg=${1:-"Hello World"}

response='HTTP/1.1 200\r\n'
response+='Content-Type: text/html\r\n\r\n'
response+="<h1>${msg}<h1\>"

while true; do
    echo -e "${response}" | nc -lvN 3000
done
