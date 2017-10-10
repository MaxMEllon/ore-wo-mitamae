git_clone "#{node[:env][:home]}/local/src/hw" do
  repository 'https://github.com/tkengo/highway.git'
  depth 1
end

execute 'install dependency libraries' do
  libs = [
    'autoconf',
    'automake',
    'google-perftools'
  ].compact.join(' ')

  command <<-EOF
    sudo apt-get install -y #{libs}
  EOF
end

execute 'make binary of hw from source code' do
  command <<-EOF
    ./tools/build.sh
  EOF

  cwd "#{node[:env][:home]}/local/src/hw"
end
