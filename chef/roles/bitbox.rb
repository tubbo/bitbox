name "bitbox"
description "Provisions and installs the latest version of Bitbox"
run_list [
  'recipe[build-essential]',
  'recipe[apt]',
  "recipe[postgresql]",
  'recipe[btsync]',
  'recipe[bitbox]'
]
default_attributes \
  postgresql: {
    username: 'bitbox',
    superuser: true,
    createdb: true,
    login: true,
    pg_hba: [
      {type: 'local', db: 'all', user: 'all', addr: nil, method: 'trust'}
    ],
    password: {
      postgres: '9678fd32f829d44e4eb45b0916b5adbc'
    }
  },
  puma: {
    socket_url: 'unix:///var/www/bitbox/tmp/puma.sock',
    rubygems_location: '/usr/bin/gem',
    user: "vagrant",
    bind_address: 'tcp://127.0.0.1:3000'
  },
  rails: {
    environment: 'development',
    directory: '/var/www/bitbox',
    url: 'http://127.0.0.1:3000'
  }
