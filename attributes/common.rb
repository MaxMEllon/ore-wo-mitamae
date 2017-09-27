node[:env] = {}
node[:env][:home] = case node[:platform]
                    when 'darwin'
                      File.join('/Users', ENV['USER'])
                    else
                      ENV['USER'] ||= 'circleci'
                      File.join('/home', ENV['USER'])
                    end

node[:env][:gopath] = "#{node[:env][:home]}/local/go"

node[:env][:node_version] = '8.5.0'
