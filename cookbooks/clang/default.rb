execute 'install dependency libraries' do
  libs = [
    'subversion',
    'make',
    'cmake',
    'gcc',
    'python',
    'libtool',
    'zlib1g',
    'zlib1g-dev'
  ].compact.join(' ')

  command <<-EOF
    sudo apt-get install -y #{libs}
  EOF
end

execute 'make binary of clang from source code' do
  command <<-EOF
    svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
    cd llvm/tools
    svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
    cd ../..
    cd llvm/tools/clang/tools
    svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
    cd ../../../..
    cd llvm/projects
    svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
    cd ../..

    mkdir build
    cd build
    cmake -G "Unix Makefiles" ../llvm/ -DCMAKE_BUILD_TYPE=Release
    make -j4
    sudo make install
  EOF

  cwd "#{node[:env][:home]}/local/src"
end
