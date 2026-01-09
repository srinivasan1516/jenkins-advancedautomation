#!/bin/bash

BLUE_PORT=3001
GREEN_PORT=3002
ACTIVE_PORT=$(cat /tmp/active_port 2>/dev/null || echo 3001)

if [ "$ACTIVE_PORT" == "3001" ]; then
  NEW_PORT=$GREEN_PORT
  NEW_APP="green"
else
  NEW_PORT=$BLUE_PORT
  NEW_APP="blue"
fi

echo "Deploying to $NEW_APP on port $NEW_PORT"

cd backend
npm install

PORT=$NEW_PORT pm2 start server.js --name app-$NEW_APP --update-env

echo $NEW_PORT > /tmp/new_port
