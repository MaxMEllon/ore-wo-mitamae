git_clone "#{node[:env][:home]}/local/src/tmux" do
  repository 'https://github.com/tmux/tmux.git'
  depth 1
  branch 'tmux-2.5'
end

execute 'install dependency libraries' do
  libs = [
    'automake',
    'libvent-dev',
    'libncurses5-dev',
    'xsel'
  ].compact.join(' ')

  command <<-EOF
    sudo apt-get install -y #{libs}
  EOF

  cwd "#{node[:env][:home]}/local/src/tmux"
end

execute 'make source code' do
  command <<-EOF
    bash autogen.sh
    ./configure
    make -j4
    sudo make install
  EOF
end
