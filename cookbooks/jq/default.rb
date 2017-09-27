git_clone "#{node[:env][:home]}/local/src/jq" do
  repository 'https://github.com/stedolan/jq.git'
  depth 1
end

execute 'install dependency libraries' do
  libs = [
    'dh-autoreconf'
  ].compact.join(' ')

  command <<-EOF
    sudo apt-get install -y #{libs}
  EOF
end

execute 'make binary of jq from source code' do
  command <<-EOF
    git submodule update --init
    autoreconf -fi
    ./configure --with-oniguruma=builtin
    make -j8
    make check
    sudo make install
  EOF

  cwd "#{node[:env][:home]}/local/src/jq"
end
