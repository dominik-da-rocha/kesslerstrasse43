#!/bin/bash

if [[ ! -f "rootCA.key" && ! -f "rootCA.crt" ]]; then
   openssl req -x509 \
      -sha256 -days 356 \
      -nodes \
      -newkey rsa:2048 \
      -subj "/CN=localhost/C=DE/L=Rostock" \
      -keyout rootCA.key -out rootCA.crt
fi

domain=$1
if [[ "$domain" == "" ]]; then
   echo please provide domain name
   exit 1
fi

openssl genrsa -out "$domain.key" 2048

openssl req -new -key "$domain.key" \
   -out "$domain.csr" \
   -config "$domain.csr.conf"

openssl x509 -req \
   -in "$domain.csr" \
   -CA rootCA.crt -CAkey rootCA.key \
   -CAcreateserial -out "$domain.crt" \
   -days 365 \
   -sha256 -extfile "$domain.crt.conf"

chmod 640 "$domain.key"
chmod 664 "$domain.csr"
chmod 640 "$domain.crt"
chmod 664 "$domain.csr.conf"
chmod 664 "$domain.crt.conf"

chown root:root "$domain.key"
chown root:root "$domain.csr"
chown root:root "$domain.csr.conf"
chown root:root "$domain.crt"
chown root:root "$domain.crt.conf"
