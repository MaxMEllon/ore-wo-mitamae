execute 'install postgresql' do
  command <<-EOF
    sudo apt-get install postgresql
  EOF
end
