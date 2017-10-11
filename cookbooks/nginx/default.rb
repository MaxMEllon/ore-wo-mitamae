execute 'install nginx' do
  command <<-EOF
    curl http://nginx.org/keys/nginx_signing.key | sudo apt-key add -

    VCNAME=`cat /etc/lsb-release | \
      grep DISTRIB_CODENAME | \
      cut -d= -f2` && \
      sudo -E sh -c "echo \"deb http://nginx.org/packages/ubuntu/ $VCNAME nginx\" >> \
      /etc/apt/sources.list"
    VCNAME=`cat /etc/lsb-release | \
      grep DISTRIB_CODENAME | \
      cut -d= -f2` && \
      sudo -E sh -c "echo \"deb-src http://nginx.org/packages/ubuntu/ $VCNAME nginx\" >> \
      /etc/apt/sources.list"

    sudo apt-get install nginx
  EOF
end
