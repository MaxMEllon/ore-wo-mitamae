execute 'install mysql' do
  command <<-EOF
    sudo apt-get update
    sudo apt-get install mysql-server mysql-client
  EOF
end
