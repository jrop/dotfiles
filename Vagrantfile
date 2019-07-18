Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provision "shell", inline: <<-SCRIPT
    type python 2>&1 >/dev/null || {
      sudo apt update
      sudo apt install -y python
    }
  SCRIPT

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
