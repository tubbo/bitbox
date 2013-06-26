include_recipe 'puma'

directory "/var/www/shared/puma" do
    recursive true
  user 'vagrant'
  group 'vagrant'
  mode 0755
  action :create
end
file '/var/www/shared/puma/bitbox.pid' do
  user "vagrant"
  group "vagrant"
  mode 0775
  action :create_if_missing
end
file '/var/www/shared/puma/bitbox.state' do
  user "vagrant"
  group "vagrant"
  mode 0775
  action :create_if_missing
end
gem_package 'bundler'
package 'libxslt-dev'
package 'libxml2-dev'
package 'nodejs' # @Tom, this is for you to not use rubyracer
gem_package 'nokogiri'

postgresql_user "bitbox" do
  password "bitbox_user"
  privileges superuser: true, createdb: true, login: true
end
["development","test"].each do |env|
  postgresql_database "bitbox_#{env}" do
    owner "bitbox"
    encoding "utf8"
    template "template0"
    locale "en_US.UTF8"
  end
end

bash "install gems" do
  code %(
    cd /vagrant &&
    bundle install --deployment --without=development,test
  )
end
bash "setup DB" do
  code %(
    cd /vagrant &&
    bundle exec rake db:migrate &&
    bundle exec rake db:test:prepare
  )
end
puma_config 'bitbox' do
  @user = node[:puma][:user]
  environment node[:rails][:environment]
  directory node[:rails][:directory]
  #app_directory node[:rails][:directory]
  bind node[:puma][:bind_address]
  notifies :restart, resources(:service => "monit")
end