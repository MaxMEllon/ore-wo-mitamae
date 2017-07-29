git_clone "#{node[:env][:home]}/.pyenv" do
  repository 'https://github.com/pyenv/pyenv.git'
  depth 1
end

execute 'install pyenv 3.6.2' do
  command <<-EOF
    export PATH="#{node[:env][:home]}/.pyenv/bin:${PATH}"
    eval "$(pyenv init -)"
    pyenv install 2.7.13 -f
    pyenv install 3.6.2 -f
    pyenv global 3.6.2 2.7.13
  EOF

  not_if 'which python && python -V | grep 3.6.2'
end
