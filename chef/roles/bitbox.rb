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
    username: 'vagrant',
    superuser: true,
    createdb: true,
    login: true,
    pg_hba: [
      "local  all   all                 trust",
      "host   all   all   127.0.0.1/32  md5",
      "host   all   all   ::1/128       md5"
    ],
    password: {
      postgres: 'hehbebbeh'
    }
  },
  puma: {
    socket_url: 'unix:///var/www/bitbox/tmp/puma.sock',
  },
  rails: {
    environment: 'development',
    directory: '/var/www/bitbox',
    url: 'http://127.0.0.1:3000'
  }
