#!/bin/sh
# Start Nginx in the background
nginx &
cd /app && rails server -p 3001 -b 0.0.0.0
