execute 'install redis' do
  command <<-EOF
    sudo apt-get install redis-server
  EOF
end
