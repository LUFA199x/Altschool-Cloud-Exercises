#!/bin/bash
​
# Update & Upgrade Packages
apt -y update && sudo apt -y upgrade
​
#Install GnuPG
apt install -y gnupg2
​
# Add PostgreSQL APT Repository
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
​
# Download PostgreSQL ASC Key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
​
# Update Packages
apt -y update
​
# Install PostgreSQL
apt -y install postgresql-15
​
# Create database
sudo -i -u postgres psql -c "CREATE DATABASE solaoluwalufa WITH ENCODING 'UTF8' TEMPLATE template0"
​
# Create User
sudo -i -u postgres psql -c "CREATE USER solaoluwalufa WITH ENCRYPTED PASSWORD 'solaoluwalufa'"
​
# Grant user privilege on database
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE solaoluwalufa to solaoluwalufa"
​
# Configure user login method in pg_hba.conf
echo -e 'local\tall\t\tsolaoluwalufa\t\t\t\t\tmd5' >>/etc/postgresql/15/main/pg_hba.conf
​
# Restart PostgreSQL
systemctl restart postgresql