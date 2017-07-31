node[:env] = {}
node[:env][:home] = case node[:platform]
                    when 'darwin'
                      File.join('/Users', ENV['USER'])
                    else
                      File.join('/home', ENV['USER'])
                    end

node[:env][:gopath] = "#{node[:env][:home]}/local/go"
