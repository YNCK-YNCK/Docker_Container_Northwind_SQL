#!/bin/bash

# Passwort-Abfrage
read -s -p "Enter SA password for SQL Server: " SA_PASSWORD
echo

# Export für docker-compose
export SA_PASSWORD

# Start
docker compose up --build
