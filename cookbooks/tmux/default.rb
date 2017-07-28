git_clone "#{node[:env][:home]}/local/src/tmux" do
  repository 'https://github.com/tmux/tmux.git'
  depth 1
  branch '2.5'
end

execute 'install dependency libraries' do
  libs = [
    'automake',
    'libevent-dev',
    'libncurses5-dev',
    'libtool',
    'pkg-config',
    'xsel'
  ].compact.join(' ')

  command <<-EOF
    dpkg -l pkg-config
    ls -l /usr/share/aclocal/pkg.m4
    sudo apt-get install -y #{libs}
  EOF

  cwd "#{node[:env][:home]}/local/src/tmux"
end

execute 'make source code' do
  command <<-EOF
    ./autogen.sh
    ./configure
    make -j4
    sudo make install
  EOF

  cwd "#{node[:env][:home]}/local/src/tmux"
end
