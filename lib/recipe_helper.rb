define :git_clone, repository: nil, depth: nil do
  path = params[:name]
  opt = '--depth=%d' % params[:depth] if params[:depth]
  opt ||= ''
  repository = params[:repository]

  execute "git clone #{opt} #{repository} #{path}" do
    command <<-EOF
      git clone #{opt} #{repository} #{path} #{opt}
    EOF
  end
end
