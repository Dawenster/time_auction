# require 'yaml'
# yaml_data = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'mailer.yml'))).result)
# MAILER_CONFIG = HashWithIndifferentAccess.new(yaml_data)

# ActionMailer::Base.smtp_settings = {
#   address: "smtp.gmail.com",
#   port: 25,
#   user_name: MAILER_CONFIG[:username],
#   password: MAILER_CONFIG[:password],
#   authentication: :login
# }
