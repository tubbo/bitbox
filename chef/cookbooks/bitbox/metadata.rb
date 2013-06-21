name              "bitbox"
maintainer        "Tom Scott"
maintainer_email  "tubbo@psychedeli.ca"
license           "MIT"
description       "Installs Bitbox, an app for managing BitTorrent Sync"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"
recipe            "btsync", "installs Bitbox"

depends "apt"
depends "btsync"

%w{ ubuntu debian }.each do |os|
  supports os
end
