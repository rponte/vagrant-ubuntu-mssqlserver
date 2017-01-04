#!/bin/bash

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

# Check if Portalcm environment is already installed
RUN_ONCE_FLAG=~/.mssqlserver_env_build_time

if [ -e "$RUN_ONCE_FLAG" ]; then
  echo "Portalcm environment is already installed."
  exit 0
fi

##
# Sqlserver tools - https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-ubuntu
##

# 1. imports and registers public repository
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list

# 2. installs package
sudo apt-get update -y
sudo apt-get install -y mssql-server

# 3. configures database
sudo SA_PASSWORD='vagrant@2017' /opt/mssql/bin/sqlservr-setup --accept-eula --set-sa-password --enable-service

# 4. starts database instance
sudo systemctl start mssql-server

##
# Sqlserver tools - https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools#ubuntu
##

# 5. imports and registers public repository
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

# 6. installs package
sudo apt-get update -y
# I couldnt figure out how to configure non-interactive mode yet
#sudo apt-get install mssql-tools -y 

# Cleaning unneeded packages
sudo apt-get autoremove -y
sudo apt-get clean

# Configures prompt color
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc

# sets "run once" flag
date > $RUN_ONCE_FLAG