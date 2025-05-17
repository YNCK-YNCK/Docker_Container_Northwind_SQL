#!/bin/bash
read -s -p "Enter SA password for SQL Server: " SA_PASSWORD
echo
export SA_PASSWORD

docker-compose up --build
