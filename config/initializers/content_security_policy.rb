# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  policy.connect_src(:self, :https, "https://*.tiles.mapbox.com", "https://api.mapbox.com")
  if Rails.env.development?
    policy.connect_src(:self, :https, "https://localhost:3035", "wss://localhost:3035")
    policy.script_src(:self, :https, :unsafe_eval)
  else
    policy.script_src(:self, :https)
  end
  # Not supported in Safari, required by Chrome for Mapbox-workers
  policy.worker_src(:self, :https, :blob)

  policy.object_src(:none)
  policy.base_uri(:none)

  # Specify URI for violation reports
  policy.report_uri("/csp-violation-report")
end

# If you are using UJS then enable automatic nonce generation
Rails.application.config.content_security_policy_nonce_generator = ->(request) { SecureRandom.base64(16) }

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
Rails.application.config.content_security_policy_report_only = true
