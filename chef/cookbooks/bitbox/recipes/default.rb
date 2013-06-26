include_recipe 'git'
include_recipe 'puma'

directory '/var/www/bitbox' do
  recursive true
  user 'vagrant'
  group 'vagrant'
  mode 0755
  action :create
end
git '/var/www/bitbox' do
  repository 'git://github.com/tubbo/bitbox.git'
  action :sync
end
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
gem_package 'bundler' do
  action :install
end
package 'libxslt-dev' do
  action :install
end
package 'libxml2-dev' do
  action :install
end
gem_package 'nokogiri' do
  action :install
end
package "nodejs" do # @Tom, this is for you to not use rubyracer
  action :install
end
user "bitbox" do
  action :create
  home '/home/bitbox'
end
postgres_user "bitbox" do
  password "bitbox_user"
  privelages \
    superuser: true,
    createdb: true,
    login: true
end
postgres_database "bitbox_development" do
  owner "bitbox"
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end
postgres_database "bitbox_test" do
  owner "bitbox"
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end
bash "install gems" do
  code %(
    cd /var/www/bitbox &&
    bundle install --deployment --without=development,test
    rake db:migrate
  )
end

puma_config 'bitbox' do
  @user = node[:puma][:user]
  environment node[:rails][:environment]
  directory '/var/www'
  app_directory node[:rails][:directory]
  bind node[:puma][:bind_address]
  notifies :restart, resources(:service => "monit")
end