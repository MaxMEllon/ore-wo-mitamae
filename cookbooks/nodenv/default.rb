git_clone "#{node[:env][:home]}/.nodenv" do
  repository 'https://github.com/nodenv/nodenv.git'
  depth 1
end

git_clone "#{node[:env][:home]}/.nodenv/plugins/node-build" do
  repository 'https://github.com/nodenv/node-build.git'
  depth 1
end

execute 'install node 8.2.1' do
  command <<-EOF
    export PATH="#{node[:env][:node]}/.nodenv/bin:${PATH}"
    eval "$(nodenv init -)"
    nodenv install 8.2.1 -f
    nodenv global 8.2.1
  EOF
  not_if 'which node && node --version | grep v8.2.1'
end

