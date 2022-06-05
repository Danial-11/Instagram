# frozen_string_literal: true

# application
require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Instagram
  # application class
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq
  end
end
