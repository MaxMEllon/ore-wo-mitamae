git_clone "#{node[:env][:home]}/local/src/fzy" do
  repository 'https://github.com/jhawthorn/fzy.git'
  branch '0.9'
  depth 1
end

execute 'make binary of fzy from source code' do
  command <<-EOF
    make
    sudo make install
  EOF

  cwd "#{node[:env][:home]}/local/src/fzy"
end
