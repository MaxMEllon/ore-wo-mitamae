git_clone "#{node[:env][:home]}/.vim" do
  repository 'https://github.com/MaxMEllon/.vim.git'
  depth 1
end

execute 'deploy to vimrc' do
  command <<-EOF
    sudo apt-get install -y wget
    make install
    mkdir -p #{node[:env][:home]}/.vim/autoload
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim
  EOF

  cwd "#{node[:env][:home]}/.vim"
end
