#!/bin/bash

NEW_PORT=$(cat /tmp/new_port)

sudo sed -i "s/proxy_pass http:\/\/localhost:.*/proxy_pass http:\/\/localhost:$NEW_PORT;/" \
/etc/nginx/conf.d/app.conf

sudo nginx -s reload

echo $NEW_PORT > /tmp/active_port
