git_clone "#{node[:env][:home]}/local/src/git" do
  repository 'https://github.com/git/git.git'
  branch 'v2.13.3'
  depth 1
end

execute 'compile source code of git' do
  libs = [
    'autoconf',
    'gettext',
    'asciidoc',
    'libcurl4-openssl-dev',
    'build-essential',
    'fakeroot',
    'dpkg-dev'
  ].compact.join(' ')

  command <<-EOF
    sudo apt-get install #{libs}
    make configure
    ./configure --prefix=/usr/local --with-curl=/usr/local
    make all doc
    sudo make install install-doc install-html
  EOF

  cwd "#{node[:env][:home]}/local/src/git"
end
