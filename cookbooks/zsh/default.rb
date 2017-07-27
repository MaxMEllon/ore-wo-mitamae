git_clone "#{node[:env][:home]}/local/src/zsh" do
  repository 'https://github.com/zsh-users/zsh.git'
  depth 1
  branch 'zsh-5.3.1'
end

execute 'install dependency libraries' do
  libs = [
    'gcc',
    'make',
    'autoconf',
    'yodl',
    'libncursesw5-dev',
    'texinfo'
  ].compact.join(' ')

  command <<-EOF
    sudo apt-get install -y #{libs}
  EOF

  cwd "#{node[:env][:home]}/local/src/zsh"
end

execute 'make source code' do
  command <<-EOF
    ./Util/preconfig

    ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --bindir=/bin \
              --infodir=/usr/share/info \
              --enable-maildir-support \
              --enable-max-jobtable-size=256 \
              --enable-etcdir=/etc/zsh \
              --enable-function-subdirs \
              --enable-site-fndir=/usr/local/share/zsh/site-functions \
              --enable-fndir=/usr/share/zsh/functions \
              --with-tcsetpgrp \
              --with-term-lib="ncursesw" \
              --enable-cap \
              --enable-pcre \
              --enable-readnullcmd=pager \
              --enable-custom-patchlevel=Debian \
              LDFLAGS="-Wl,--as-needed -g"

    make
    sudo make install
  EOF

  cwd "#{node[:env][:home]}/local/src/zsh"
end
