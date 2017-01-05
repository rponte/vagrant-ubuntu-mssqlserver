# vagrant-ubuntu-mssqlserver

Vagrant project to install MS SQL Server vNext CTP 1.1 on Linux Ubuntu 16.04

## Requirements

* You need to have [Vagrant](http://www.vagrantup.com/) installed;
* You need to have [VirtualBox](https://www.virtualbox.org/) installed;
* The host machine needs at least 6 GB of RAM, because SQL Server installation claims 4 GB of RAM;
* As SQL Server vNext is only available for 64-bit machines at the moment, the host machine needs to have a 64-bit architecture;
* You may need to [enable virtualization](http://www.sysprobs.com/disable-enable-virtualization-technology-bios) manually;

## Installation

* Check out this project:

        git clone git@github.com:rponte/vagrant-ubuntu-mssqlserver.git

* Install [vbguest](https://github.com/dotless-de/vagrant-vbguest):

        vagrant plugin install vagrant-vbguest

* Install [vagrant-proxyconf](https://github.com/tmatilai/vagrant-proxyconf):

        vagrant plugin install vagrant-proxyconf

* Run `vagrant up` from the base directory of this project. The first time this will take a while -- up to 30 minutes on
  my machine. Please note that building the VM involves downloading an Ubuntu 16.04
  [base box](https://atlas.hashicorp.com/ubuntu/boxes/xenial64) which is over 300MB in size;
  
## Connecting
  
You should now be able to connect to the new database at `localhost:1433` as `sa` with password `vagrant@2017`. You can connect to the SQL Server instance from outside the container by using various command line and GUI tools on the host or remote computers. See the [Connect and Query](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-connect-and-query-sqlcmd) topic in the SQL Server on Linux documentation.

## Alternatives

You may also want to consider a Docker-based solution such as [mssql-server-linux](https://hub.docker.com/r/microsoft/mssql-server-linux/).
