require 'socket'

local_ip = Socket::getaddrinfo(Socket.gethostname,"echo",Socket::AF_INET)[0][3]

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/precise64"
  config.vm.hostname = "mongodb-dev"

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://" + local_ip + ":53128/"
    config.proxy.https    = "http://" + local_ip + ":53128/"
    config.proxy.no_proxy = "localhost,127.0.0.1," + local_ip
  end

  config.vm.provision "fix-no-tty", type: "shell" do |s|
	s.privileged = false
	s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  config.vm.provision "shell", path: "provision.sh"

  # for mongodb access
  config.vm.network "forwarded_port", host: 27017, guest: 27017
  
end