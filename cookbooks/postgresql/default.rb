execute 'install postgresql' do
  command <<-EOF
    sudo apt-get install postgresql-9.3
  EOF
end
