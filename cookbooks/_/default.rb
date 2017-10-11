execute 'apt update' do
  command <<-EOF
    sudo apt-get update
  EOF
end
