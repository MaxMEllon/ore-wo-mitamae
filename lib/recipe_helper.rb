# execute 'set locale' do
#   command <<-EOF
#     sudo update-locale LC_ALL=en_US.UTF-8
#   EOF
# end

define :include_cookbook, recipe: 'default' do
  root_dir = File.expand_path('../..', __FILE__)
  include_recipe File.join(root_dir, 'cookbooks', params[:name], params[:recipe])
end

define :include_attribute do
  root_dir = File.expand_path('../..', __FILE__)
  include_recipe File.join(root_dir, 'attributes', params[:name])
end

define :git_clone, repository: nil, depth: nil, branch: nil do
  path = params[:name]
  opt = '--depth=%d' % params[:depth] if params[:depth]
  opt ||= ''
  branch = "-b #{params[:branch]}" if params[:branch]
  branch ||= ''
  repository = params[:repository]
  cmd = ['git', 'clone', opt, branch, repository, path].compact.join(' ')

  execute "#{cmd}" do
    run_command cmd
    not_if "test -d #{path}"
  end
end
