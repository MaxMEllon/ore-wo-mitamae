git_clone "/home/#{ENV['USER']}/.pyenv" do
  repository 'https://github.com/pyenv/pyenv.git'
  depth 1
end

execute 'install pyenv 3.6.1' do
  command <<-EOF
    export PATH="${HOME}/.pyenv/bin:${PATH}"
    eval "$(pyenv init -)"
    pyenv install 3.6.1 -f
    pyenv global 3.6.1
  EOF

  not_if 'which python && python -V | grep 3.6.1'
end
