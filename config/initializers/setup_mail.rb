if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      'app32529067@heroku.com',
    password:       'exAmplePa$$',
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end