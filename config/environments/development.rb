# encoding: utf-8

Financial::Application.configure do
  # Settings specified here will take precedence over those
  # in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
end

ENV['SECRET_TOKEN'] = '981917b9586a52b22e4b964b987b2f5b9a6deb00c131718e3d169c4a976ad3b91ecb93057cdd82a0334b9e0ddc8edf66898f75f24540910c03ed4b3940bb9044'
