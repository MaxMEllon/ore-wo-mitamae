git_clone "/home/#{ENV['USER']}/.rbenv" do
  repository 'https://github.com/rbenv/rbenv.git'
  depth 1
end

git_clone "/home/#{ENV['USER']}/.rbenv/plugins/ruby-build" do
  repository 'https://github.com/rbenv/ruby-build.git'
  depth 1
end

execute 'install ruby 2.4.1' do
  command <<-EOF
    export PATH="~/.rbenv/bin:${PATH}"
    eval "$(rbenv init -)"
    rbenv install 2.4.1
  EOF

  not_if 'which ruby && ruby --version | grep 2.4.1'
end
