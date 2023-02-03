#!/bin/bash
msg=${1:-"Hello World"}

response="HTTP/1.1 200\r\n"
response+="Content-Type: text/html\r\n\r\n"
response+="${msg}"

while 1
do
    echo -e "${response}" | nc -lvN 3000
done
