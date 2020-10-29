#!/bin/bash

if [ "$1" == "prod" ]; then
  echo "Time for Production 😎"
  docker-compose -f docker-compose.prod.yml up -d --build
else
  echo "Starting Development Environment 🤖"
  docker-compose up -d --build
fi
