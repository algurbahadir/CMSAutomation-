#!/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Navigate to the project directory
cd "$(dirname "$0")"

echo -e "${GREEN}Building Docker images...${NC}"
# Build Docker images
docker-compose build || { echo -e "${RED}Failed to build Docker images.${NC}"; exit 1; }

echo -e "${GREEN}Starting Docker containers...${NC}"
# Start Docker containers
docker-compose up -d || { echo -e "${RED}Failed to start Docker containers.${NC}"; exit 1; }

# Wait for the database to be ready
echo "Waiting for the database to become available..."
sleep 10 # Adjust this based on how quickly your database container becomes ready

echo -e "${GREEN}Applying Django migrations...${NC}"
# Apply Django migrations
docker-compose exec web python manage.py migrate || { echo -e "${RED}Failed to apply Django migrations.${NC}"; exit 1; }

echo -e "${GREEN}Collecting static files...${NC}"
# Collect static files
docker-compose exec web python manage.py collectstatic --no-input || { echo -e "${RED}Failed to collect static files.${NC}"; exit 1; }

echo -e "${GREEN}Setup completed successfully.${NC}"
