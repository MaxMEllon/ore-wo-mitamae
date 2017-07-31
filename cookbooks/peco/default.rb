git_clone "#{node[:env][:home]}/local/src/peco" do
  repository 'https://github.com/peco/peco.git'
  branch 'v0.5.1'
  depth 1
end

execute 'install peco' do
  command <<-EOF
    export PATH="#{node[:env][:gopath]}/bin:${PATH}"
    glide install
    go build cmd/peco/peco.go
    sudo cp peco /usr/local/bin/
  EOF

  cwd "#{node[:env][:home]}/local/src/peco"
end
