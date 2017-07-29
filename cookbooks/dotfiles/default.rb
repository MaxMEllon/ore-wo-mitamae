git_clone "#{node[:env][:home]}/.dotfiles" do
  repository 'https://github.com/MaxMEllon/.dotfiles.git'
  depth 1
end

execute 'deploy of dotfiles' do
  command <<-EOF
    bash init.sh
    echo "ANY_ENV_LIST=(pyenv rbenv nodenv)" > "#{node[:env][:home]}/.env"
    echo "export ANY_ENV_LIST" >> "#{node[:env][:home]}/.env"
  EOF
  cwd "#{node[:env][:home]}/.dotfiles"
end
