git_clone "#{node[:env][:home]}/.pyenv" do
  repository 'https://github.com/pyenv/pyenv.git'
  depth 1
end

execute 'install pyenv 3.5.3' do
  command <<-EOF
    export PATH="#{node[:env][:home]}/.pyenv/bin:${PATH}"
    eval "$(pyenv init -)"
    pyenv install 3.5.3 -f
    pyenv global 3.5.3
  EOF

  not_if 'which python && python -V | grep 3.5.3'
end
