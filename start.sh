#!/bin/bash
if [ $1 == "prod" ]; then
  echo "production!"
  docker-compose -f docker-compose.prod.yml up -d --build
else
  echo "development..."
  docker-compose up -d --build
fi