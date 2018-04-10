git_clone "#{node[:env][:home]}/.rbenv" do
  repository 'https://github.com/rbenv/rbenv.git'
  depth 1
end

git_clone "#{node[:env][:home]}/.rbenv/plugins/ruby-build" do
  repository 'https://github.com/rbenv/ruby-build.git'
  depth 1
end

execute 'install dependency libraries' do
  libs = [
    'libssl-dev',
    'libreadline-dev',
    'zlib1g-dev'
  ].compact.join(' ')
  command <<-EOF
    sudo apt-get install -y #{libs}
  EOF
end

v = node[:env][:ruby_version]

execute "install ruby #{v}" do
  command <<-EOF
    export PATH="#{node[:env][:home]}/.rbenv/bin:${PATH}"
    eval "$(rbenv init -)"
    rbenv install #{v} -f
    rbenv global #{v}
  EOF

  not_if 'which ruby && ruby --version | grep 2.4.1'
end
