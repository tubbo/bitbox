require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups(:assets => %w(development test))) \
  if defined?(Bundler)

module Bitbox
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Turn off mass-assignment protection
    config.active_record.whitelist_attributes = false

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.action_mailer.default_url_options = { :host => 'localhost:3000' }
    config.ember.variant = :development

    config.bitbox = ActiveSupport::OrderedOptions.new
    config.bitbox.sync_folder = File.expand_path "~/Sync"
  end
end
