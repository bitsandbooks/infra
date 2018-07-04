Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.define "vm-machine" do |host|
    host.vm.hostname = "vm-machine.domain.dev"
    host.vm.provision :shell, path: "provisioners/vm-nas.sh"
    host.vm.network 'private_network', ip: "192.168.56.200"
  end

  config.vm.synced_folder ".", "/srv/ansible"
end
