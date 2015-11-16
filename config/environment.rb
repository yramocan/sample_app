# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Configure ActionMailer to use SendGrid
# ActionMailer::Base.smtp_settings = {
#   :user_name => 'SENDGIRD_USERNAME',
#   :password => 'SENDGIRD_PASSWORD',
#   :domain => 'localhost:3000',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }

config.action_mailer.delivery_method = :smtp

# Configure ActionMailer to use MailGun
config.action_mailer.smtp_settings = {
	:port           => ENV['MAILGUN_SMTP_PORT'],
	:address        => ENV['MAILGUN_SMTP_SERVER'],
	:user_name      => ENV['MAILGUN_SMTP_LOGIN'],
	:password       => ENV['MAILGUN_SMTP_PASSWORD'],
	:domain         => 'lit-shore-7122.herokuapp.com',
	:authentication => :plain,
}
