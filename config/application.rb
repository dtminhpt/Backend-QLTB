require_relative 'boot'

require "rails"
  # active_storage/engine
  # action_cable/engine
  # action_mailbox/engine
  # action_text/engine
  # rails/test_unit/railtie
  # action_text/engine
%w(
  action_controller/railtie
  action_view/railtie
  sprockets/railtie
  active_job/railtie
  action_mailer/railtie
  active_record/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Properties
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.assets false
      g.helper false
      g.template_engine false
    end
  end
end
