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
