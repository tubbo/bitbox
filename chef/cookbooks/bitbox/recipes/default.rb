include_recipe 'git'
include_recipe 'puma'

directory '/var/www/bitbox' do
  user 'vagrant'
  group 'vagrant'
  mode 0755
  action :create
end

git '/var/www/bitbox' do
  repository 'git://github.com/tubbo/bitbox.git'
  action :sync
end

gem_package 'bundler' do
  action :install
end

bash "install gems" do
  code %(
    cd /var/www/bibox &&
    bundle install --deployment --without=development,test
  )
end

puma_config 'bitbox' do
  environment node[:rails][:environment]
  directory node[:rails][:directory]
  bind node[:rails][:url]
  monit false
end

service 'puma' do
  action :start
end
