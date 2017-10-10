Vagrant.configure('2') do |c|
  c.vm.box = 'ubuntu/trusty64'

  c.vm.box_check_update = false
  c.vm.boot_timeout     = 300

  port = ENV.fetch('VAGRANT_SSH_PORT', 2222)
  c.vm.network :forwarded_port, guest: 22, host: port, id: 'ssh', auto_correct: true

  c.vm.provider 'virtualbox' do |vb|
    vb.memory = ENV.fetch('VAGRANT_MEMORY', 2048)
    vb.cpus = ENV.fetch('VAGRANT_CPUS', 2)
  end

  c.vm.provision 'shell', inline: <<-SHELL
    sudo apt-get install -y git

    echo 'git clone --depth=1 https://github.com/MaxMEllon/ore-wo-mitamae.git /home/vagrant/mitamae' > /home/vagrant/install
    echo 'cd /home/vagrant/mitamae && bin/setup' >> /home/vagrant/install
    echo 'bin/mitamae local bootstrap.rb -l debug' >> /home/vagrant/install

    chown vagrant: /home/vagrant/install
    chmod +x /home/vagrant/install
  SHELL
end
