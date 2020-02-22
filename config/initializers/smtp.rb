# Configure SendGrid
ActionMailer::Base.smtp_settings = {
  user_name: ENV.fetch("SENDGRID_USERNAME", ""),
  password: ENV.fetch("SENDGRID_PASSWORD", ""),
  domain: ENV.fetch("APP_HOST", ""),
  address: "smtp.sendgrid.net",
  port: 465,
  authentication: :plain,
  enable_starttls_auto: true,
}
