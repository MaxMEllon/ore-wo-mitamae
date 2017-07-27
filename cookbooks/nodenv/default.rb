git_clone "/home/#{ENV['USER']}/.nodenv" do
  repository 'https://github.com/nodenv/nodenv.git'
  depth 1
end

git_clone "/home/#{ENV['USER']}/.nodenv/plugins/node-build" do
  repository 'https://github.com/nodenv/node-build.git'
  depth 1
end

execute 'install node 8.2.1' do
  command <<-EOF
    export PATH="~/.nodenv/bin:${PATH}"
    eval "$(nodenv init -)"
    nodenv install 8.2.1
  EOF
end

