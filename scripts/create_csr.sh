#!/bin/bash

domain="kesslerstrasse43"
subdomain=""
if [[ "$1" != "" ]]; then
   subdomain="$1."
fi

file=$subdomain$domain

openssl req -new -out "$file.csr" \
            -newkey rsa:2048 -nodes -sha256 -keyout "$file.key" \
            -config "$file.csr.conf"