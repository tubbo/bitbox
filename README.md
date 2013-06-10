# Bitbox

A Dropbox-like frontend for BitTorrent Sync. Includes a file browser and
the ability to share files on the Web with links generated from the
read-only secret, as well as add new folders through a lovely web
interface. A much better alternative to the existing BtSync web app,
with some added security precautions to make sure this app being
publicly accessible won't inadvertently expose your machine to
security risks.

Bitbox communicates with the BitTorrent Sync app via HTTP requests, and
as such **is only available for the Linux platform**. That is, any OS
that can run the [Linux BtSync app]() is capable of also running Bitbox.
We accomplish communication with the app via the [BtSync
gem](http://github.com/ChrisMacNaughton/BtSync) gem. Indeed, many
features of this very app would be impossible without this tool.

## Requirements

- Ruby v1.9+
- Bundler
- BTSync for Linux
- PostgreSQL

## Installation

Bitbox is just a [Rails](http://rubyonrails.org) app, and as such is
pretty simple to install.

Install dependencies first:

```bash
$ bundle install
```

Then, create a user and database for this app:

```bash
$ createuser -s 'bitbox'
$ rake db:setup
```

Now you're ready! Start the BTSync app and run:

```bash
$ rails server
```

You can optionally run our Foreman script that boots both apps at the
same time:

```bash
$ foreman start
```

## Development

Bitbox uses Rails for our backend API, Bundler for dependency
management, and Ember.js on the frontend for view control. We employ a
combination of Ruby, CoffeeScript, Haml and Sass to build a slick UI for
BitTorrent Sync clients. Our mission is to provide a secure and fast web
client for Sync without interfering with the way the app works for
normal clients. We also use Zurb Foundation as a framework and general
time-saver for our front-end styling.

### Contributing

Please make all contributions in the form of a Git or GitHub pull
request. All contributions will be considered for inclusion as long as
they must include tests on all levels. When writing controllers, tests for the
underlying model functionality as well as its support classes must also
be included. For front-end features, we require the use of Jasmine tests
as well as Capybara features for proper regression and acceptance
testing.
