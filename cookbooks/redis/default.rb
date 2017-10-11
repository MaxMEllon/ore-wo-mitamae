execute 'install redis' do
  command <<-EOF
    sudo apt-get install -y redis-server
  EOF
end
