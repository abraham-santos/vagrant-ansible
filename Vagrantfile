Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
    #config.vm.define "master" do |master|
    #  master.vm.box = "ubuntu/focal64"
    #end
    config.vm.define "worker" do |worker|
      worker.vm.box = "geerlingguy/ubuntu2004"
      
    end
    config.vm.network "public_network"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "3072"
      vb.cpus = "3"
      
      disk = 'disk2.vdi'
      unless File.exist?(disk)
        vb.customize [ 'createhd', '--filename', disk, '--format', 'VDI','--size', 10 * 1024, '--variant', 'Fixed' ]
        vb.customize ['modifyhd', disk, '--type', 'writethrough']
      end
      vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 1, '--type', 'hdd', '--medium', disk]
      
    end
    #config.vm.provision:shell, path: "bootstrap.sh"
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      mkfs.ext4 /dev/sdb
      mkdir -p /mnt/storage
      mkdir -p /mnt/storage/docker
      mount /dev/sdb /mnt/storage
    SHELL
    
    #
    # Run Ansible from the Vagrant Host
    #
    #config.vm.provision "ansible" do |ansible|
    #    ansible.playbook = "docker.yml"
    #end

  end