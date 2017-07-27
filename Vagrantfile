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
end
