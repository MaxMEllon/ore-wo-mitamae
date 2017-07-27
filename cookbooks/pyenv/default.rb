git_clone '~/.pyenv' do
  repository 'https://github.com/pyenv/pyenv.git'
end

execute 'install pyenv 3.6.1' do
  command <<-EOF
    export PATH="~/.pyenv/bin:${PATH}"
    eval "$(pyenv init -)"
    pyenv install 3.6.1
  EOF

  not_if 'which python && python -V | grep 3.6.1'
end
