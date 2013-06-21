name "bitbox"
description "Provisions and installs the latest version of Bitbox"
run_list [
  'recipe[build-essential]',
  'recipe[apt]',
  'recipe[btsync]',
  'recipe[rails_application]'
]
default_attributes \
  rails: {
    app: {
      name: 'bitbox'
    },
    deploy: {
      repository: 'git://github.com/tubbo/bitbox.git',
      precompile_assets: true,
      migrate: true
    },
    database: {
      type: 'postgresql',
      adapter: 'postgresql',
      name: "#{node[:rails][:app][:name]}_#{node[:rails][:app][:environment]}"
    }
  }
