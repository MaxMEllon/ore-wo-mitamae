git_clone "#{node[:env][:home]}/.vim" do
  repository 'https://github.com/MaxMEllon/.vim.git'
  depth 1
end

execute 'deploy to vimrc' do
  command <<-EOF
    make install
  EOF

  cwd "#{node[:env][:home]}/.vim"
end
