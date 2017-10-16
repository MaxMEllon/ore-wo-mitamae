execute 'install cmake' do
  command <<-EOF
    wget https://cmake.org/files/v3.10/cmake-3.10.0-rc2.tar.gz
    tar xf cmake-3.10.0-rc2.tar.gz
    cd cmake-3.10.0-rc2
    ./configure
    make
    sudo make install
  EOF

  cwd "#{node[:env][:home]}/local/src"
end
