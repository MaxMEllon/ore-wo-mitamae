define :git do
  path = params[:name]
  repository = params[:repository]
  command <<-EOF
    git clone #{repository} #{path}
  EOF
end
