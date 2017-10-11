execute 'setting locale' do
  command <<-EOF
    export LANG=en_US.UTF-8
    export LC_ALL=$LANG
    locale-gen --purge $LANG
    sudo dpkg-reconfigure -f noninteractive locales && \
    sudo /usr/sbin/update-locale LANG=$LANG LC_ALL=$LANG
  EOF
end
