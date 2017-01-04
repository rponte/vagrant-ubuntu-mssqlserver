# vagrant-ubuntu-mssqlserver

Vagrant project to install MS SQL Server vNext CTP 1.1 on Linux Ubuntu 16.04

## Requirements

* You need to have [Vagrant] installed.
* The host machine needs at least 8 GB of RAM, because SQL Server installation claims for 4 GB of RAM;
* As SQL Server vNext is only available for 64-bit machines at the moment, the host machine needs to have a 64-bit architecture;
* You may need to [enable virtualization] manually.

## Installation

* Check out this project:

        git clone git@github.com:rponte/vagrant-ubuntu-mssqlserver.git

* Install [vbguest]:

        vagrant plugin install vagrant-vbguest

* Install [[vagrant-proxyconf](https://github.com/tmatilai/vagrant-proxyconf)]:

        vagrant plugin install vagrant-proxyconf

* Run `vagrant up` from the base directory of this project. The first time this will take a while -- up to 30 minutes on
  my machine. Please note that building the VM involves downloading an Ubuntu 16.04
  [base box](https://atlas.hashicorp.com/ubuntu/boxes/xenial64) which is over 300MB in size;