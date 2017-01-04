
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  # Forward SQL Sever port
  config.vm.network :forwarded_port, guest: 1433, host: 1433

  # Provider-specific configuration so you can fine-tune various backing
  # providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM
    vb.cpus = 1
    vb.memory = "4096"

    # Keeps time in sync even when Windows sleeps
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
    vb.customize ["modifyvm", :id,
                  # Enable DNS behind NAT
                  "--natdnshostresolver1", "on"]
  end

  # configures some plugins (vagrant-vbguest and vagrant-proxyconf)
  config.vbguest.auto_update = true
  config.proxy.enabled = true

  # configures timezone; adjust as needed
  config.vm.provision :shell, :inline => "echo \"America/Fortaleza\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

  # configures locale as pt_BR and encoding as UTF-8
  $locale_and_charset_conf = <<SCRIPT
    sudo locale-gen pt_BR
    sudo locale-gen pt_BR.UTF-8
    sudo update-locale LANG=pt_BR.UTF8 LC_MESSAGES=POSIX
SCRIPT
  config.vm.provision :shell, :inline => $locale_and_charset_conf

  # Installs Microsoft SQL Server vNext
  config.vm.provision "shell", path: "bootstrap.sh", privileged: false

end