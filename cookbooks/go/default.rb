git_clone "#{node[:env][:home]}/.goenv" do
  repository 'https://github.com/syndbg/goenv.git'
  depth 1
end

execute 'install go 1.8' do
  command <<-EOF
    export PATH=#{node[:env][:home]}/.goenv/bin:${PATH}
    eval "$(goenv init -)"
    goenv install 1.8.1
    goenv global 1.8.1
  EOF

  not_if 'which go && go version | grep go1.8.1'
end

execute 'instal glide' do
  command <<-EOF
    mkdir -p #{node[:env][:gopath]}/bin
    curl https://glide.sh/get | sh
  EOF
end
