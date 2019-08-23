require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StimulusTodomvc
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      g.template_engine nil # to skip views
      g.test_framework  nil # to skip test framework
      g.assets false
      g.helper false
      g.stylesheets false
    end
  end
end
