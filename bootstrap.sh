#!/bin/bash

Skip to content
 
 
Search…
All gists
GitHub
New gist @rponte
 Edit
  Delete
  Star 0
  @rponterponte/install-mssqlserver-vnext-ubuntu.sh
Last active 3 hours ago
Embed  
<script src="https://gist.github.com/rponte/0b1e61a4597446a5d0300eb882cc345a.js"></script>
  Download ZIP
 Code  Revisions 3
Script to install MS SQL Server vNext on Linux Ubuntu 16.04 x64
Raw
 install-mssqlserver-vnext-ubuntu.sh
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
#sudo apt-get update -y
#sudo apt-get install mssql-tools -y

