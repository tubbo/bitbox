# Tasks for managing a Vagrant VM for local development on non-Linux
# devices.
namespace :vm do
  desc "Create a new Vagrant VM from scratch"
  task :create do
    sh 'vagrant init' unless Dir.exists? ".vagrant/"
  end

  desc "Install cookbooks with Librarian"
  task :cookbooks do
    sh 'librarian-chef install'
  end

  desc "Either build or provision the development VM for use."
  task :migrate do
    if `vagrant status` =~ /poweroff/
      sh 'vagrant up'
    else
      sh 'vagrant provision'
    end

    puts "Bitbox is up and running at http://localhost:8000"
  end

  desc "Enter the VM via SSH"
  task :console do
    sh 'vagrant ssh'
  end
end

desc "Build/provision a local VM for development on non-Linux machines"
task :vm => %w(vm:create vm:cookbooks vm:migrate)
