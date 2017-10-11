execute 'get binary by fzf-bin' do
  command <<-EOF
    wget https://github.com/junegunn/fzf-bin/releases/download/0.17.0/fzf-0.17.0-linux_amd64.tgz \
      -O ~/local/bin/fzf.tgz
    tar xf fzf.tgz
    rm fzf.tgz
  EOF

  cwd "#{node[:env][:home]}/local/bin"
end
