execute 'get binary from peco/peco' do
  command <<-EOF
    wget https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz \
     -O ~/local/bin/peco.tar.gz
    tar xf peco.tar.gz
    mv peco_linux_amd64/peco .
    rm -rf peco_linux_amd64
  EOF

  cwd "#{node[:env][:home]}/local/bin"
end
