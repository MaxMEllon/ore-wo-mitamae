execute 'install mysql' do
  command <<-EOF
    sudo apt-get install -y mysql-server mysql-client
  EOF
end
