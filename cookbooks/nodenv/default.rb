execute 'install nodenv' do
  git '~/.nodenv' do
    repository 'https://github.com/nodenv/nodenv.git'
  end

  git '~/.nodenv/plugins/node-build' do
    repository 'https://github.com/nodenv/node-build.git'
  end

  not_if 'test -d ~/.nodenv'
end

execute 'install node 8.2.1' do
  command <<-EOF
    export PATH="~/.nodenv/bin:${PATH}"
    eval "$(nodenv init -)"
    nodenv install 8.2.1
  EOF
end

