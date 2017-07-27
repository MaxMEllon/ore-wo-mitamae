execute 'install rbenv' do
  command <<-EOF
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  EOF

  command <<-EOF
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  EOF

  not_if 'test -d ~/.rbenv'
end
