ActionMailer::Base.smtp_settings = {
#  :address  => # IP address,
#  :port     => # Port No,
  :domain   => Rails.env.production? ? 'produccion.com' : 'pruebas.com'
#  :user_name => # User account,
#  :password   => # Password,
#  :autentication => 'plain',
#  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "empleosti.com"

