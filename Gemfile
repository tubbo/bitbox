source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'pg'
gem "strong_parameters"
gem "foreman"
gem "devise"
gem "carrierwave"
gem "draper"
gem "active_model_serializers"
gem 'jbuilder'
gem "haml-rails"
gem 'BtSync', "~> 0.6" # <3 @ChrisMacNaughton
gem 'puma'
gem 'high_voltage'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'handlebars-source', '1.0.0.rc4'
  gem "zurb-foundation"
  #gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'teaspoon'
  gem 'jquery-rails', '2.2.2'
  gem "ember-rails", github: 'tubbo/ember-rails', branch: 'emberscript-generators'
  gem 'emblem-rails'
  gem 'ember_script-rails'
end

group :development do
  gem "better_errors"
  gem "meta_request"
  gem 'chef', '>= 0.10', require: false
  gem 'librarian-chef', require: false
end

group :test do
  gem "rspec-rails"
  gem "capybara"
end

gem "pry-rails", :group => [:development, :test]
