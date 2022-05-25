# frozen_string_literal: true

Devise.setup do |config|
  config.mailer_sender = 'danial.azeem@devsinc.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.navigational_formats = ['*/*', :html, :turbo_stream]
  config.sign_out_via = :delete
  config.scoped_views = true
  config.sign_out_via = :get
  # Configuration for :confirmable
  config.allow_unconfirmed_access_for = 2.days
end
