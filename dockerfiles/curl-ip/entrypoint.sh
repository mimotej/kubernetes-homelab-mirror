#!/usr/bin/env sh

echo "Testing what ip address is visible from inside the container..."

while true; do
  printf "Testing at $(date)\n\n"
  curl -s ifconfig.me/all
  printf "\n"
  printf "Sleeping for 5 minutes...\n"
  sleep 300
done
