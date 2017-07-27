execute 'install nodenv' do
  command <<-EOF
    git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  EOF

  command <<-EOF
    got clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
  EOF

  not_if 'test -d ~/.nodenv'
end
