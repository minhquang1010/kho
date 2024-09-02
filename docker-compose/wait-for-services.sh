#!/bin/bash

# Đợi cho dịch vụ backend sẵn sàng
while ! curl -s http://backend:8080/healthcheck > /dev/null; do
  echo "Waiting for backend service..."
  sleep 1
done

# Đợi cho dịch vụ frontend sẵn sàng
while ! curl -s http://frontend:3000/healthcheck > /dev/null; do
  echo "Waiting for frontend service..."
  sleep 1
done

# Khởi động nginx
echo "All services are rea
