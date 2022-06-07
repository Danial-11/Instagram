# frozen_string_literal: true

# environment
require_relative 'application'

Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'localhost:3000',
  user_name: Rails.application.credentials.dig(:google_smtp, :email),
  password: Rails.application.credentials.dig(:google_smtp, :password),
  authentication: 'plain',
  enable_starttle_auto: true
}
