#!/bin/bash

echo "Downloading and installing Fluent Bit..."
curl -s https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh | sh

echo "Starting Fluent Bit service..."
sudo systemctl start fluent-bit

echo "Enabling Fluent Bit service to start on boot..."
sudo systemctl enable fluent-bit

echo "Checking the status of Fluent Bit service..."
sudo systemctl status fluent-bit
