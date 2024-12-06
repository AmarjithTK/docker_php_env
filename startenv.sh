#!/bin/bash

# Check if Docker is installed
if command -v docker &>/dev/null; then
    echo "Docker is installed. Using docker-compose..."
    docker-compose -f docker-compose.yml up -d --build
elif command -v podman &>/dev/null && command -v podman-compose &>/dev/null; then
    echo "Docker not found. Using podman-compose..."
    podman-compose -f docker-compose.yml up -d --build
else
    echo "Neither Docker nor Podman Compose is installed."
    exit 1
fi
