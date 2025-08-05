#!/bin/bash

USERNAME="fxxxxxxxx"
PASSWORD="Bits@zzzzzzzz"

curl --location "http://172.16.0.30:8090/login.xml" \
--data-urlencode 'mode=191' \
--data-urlencode "username=${USERNAME}" \
--data-urlencode "password=${PASSWORD}"
