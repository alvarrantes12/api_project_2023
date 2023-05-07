require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BaseProject2023
  class Application < Rails::Application

    config.load_defaults 7.0

    I18n.load_path += Dir[Rails.root.join("config", "locales", "*.{yml}")]
    I18n.default_locale = :es

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end 
  end
end
