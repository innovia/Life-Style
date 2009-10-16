# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '>=2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'mislav-will_paginate', :version => '>= 2.3.8', :lib => 'will_paginate', :source => 'http://gems.github.com'
 # config.gem 'authlogic'
  config.gem 'thoughtbot-paperclip', :version => '2.3.0', :lib => 'paperclip', :source =>  'http://gems.github.com'
  config.gem 'haml'
 # config.gem  'right_aws'
  config.time_zone = 'UTC'
  #config.gem 'google-geocode', :version => '>= 1.2.1'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

end
