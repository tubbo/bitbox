namespace :vm do
  task :provision do
    sh 'librarian-chef install'
  end

  task :build do
    sh 'vagrant up'
  end
end

desc "Build a Vagrant VM with Chef cookbooks"
task :vm => ['vm:provision', 'vm:build']
