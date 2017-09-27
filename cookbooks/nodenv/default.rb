git_clone "#{node[:env][:home]}/.nodenv" do
  repository 'https://github.com/nodenv/nodenv.git'
  depth 1
end

git_clone "#{node[:env][:home]}/.nodenv/plugins/node-build" do
  repository 'https://github.com/nodenv/node-build.git'
  depth 1
end

v = node[:env][:node_version]

execute "install node #{v}" do
  command <<-EOF
    export PATH="#{node[:env][:home]}/.nodenv/bin:${PATH}"
    eval "$(nodenv init -)"
    nodenv install #{v} -f
    nodenv global #{v}
  EOF

  not_if "which node && node --version | grep #{v}"
end

