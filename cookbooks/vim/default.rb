git_clone "#{node[:env][:home]}/local/src/vim" do
  repository 'https://github.com/vim/vim.git'
  depth 1
end

execute 'install dependency libraries' do
  libs = [
    'lua5.2',
    'liblua5.2-dev',
    'luajit',
    'libluajit-5.1',
    'libperl-dev',
    'tcl-dev'
  ].compact.join(' ')

  command <<-EOF
    sudo apt-get install -y #{libs}
  EOF
end

execute 'make binary of vim from source code' do
  command <<-EOF
    export PATH="#{node[:env][:home]}/.rbenv/bin:${PATH}"
    export PATH="#{node[:env][:home]}/.pyenv/bin:${PATH}"
    eval "$(rbenv init -)"
    eval "$(pyenv init -)"
    LDFLAGS="-Wl,-rpath=${HOME}/.pyenv/versions/2.7.13/lib:${HOME}/.pyenv/versions/3.6.2/lib:${HOME}/.rbenv/versions/2.4.1/lib" \
    ./configure \
        --enable-fail-if-missing \
        --enable-fontset \
        --enable-luainterp \
        --enable-multibyte \
        --enable-perlinterp=yes \
        --enable-python3interp=dynamic \
        --enable-pythoninterp=dynamic \
        --enable-rubyinterp=yes \
        --enable-tclinterp \
        --with-features=huge \
        --with-ruby-command=`which ruby` \
        --with-luajit
    make && sudo make install
  EOF

  cwd "#{node[:env][:home]}/local/src/vim"
end
