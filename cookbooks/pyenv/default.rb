execute 'install pyenv' do
  command <<-EOF
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  EOF

  not_if 'test -d ~/.pyenv'
end
