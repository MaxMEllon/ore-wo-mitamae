execute 'get binary by fzf-bin' do
  command <<-EOF
    mkdir bin
    wget https://github.com/junegunn/fzf-bin/releases/download/0.17.0/fzf-0.17.0-linux_amd64.tgz \
      -O ~/local/bin/fzf.tgz
    cd bin
    tar xf fzf.tgz
  EOF

  cwd "#{node[:env][:home]}/local"
end
