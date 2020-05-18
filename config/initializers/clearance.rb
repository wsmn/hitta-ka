# frozen_string_literal: true

Clearance.configure do |config|
  config.allow_sign_up = true
  config.mailer_sender = "konto@#{Rails.application.config.x.app_url}"
  config.rotate_csrf_on_sign_in = true
  config.routes = false
end
