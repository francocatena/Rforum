if ENV['RF_EMAIL'].blank? || ENV['RF_PASSWORD'].blank?
  raise <<-EOF
    You must set RF_EMAIL and RF_PASSWORD variables,
    try running the server like this:

    RF_EMAIL=my@account.org RF_PASSWORD=secret rails s

    Or if you are putting this on Heroku run:

    heroku config:add RF_EMAIL=my@account.org RF_PASSWORD=secret
  EOF
end

Animanga::Application.configure do
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: '587',
    domain: 'gmail.com',
    authentication: :plain,
    user_name: ENV['RF_EMAIL'],
    password: ENV['RF_PASSWORD']
  }

  config.action_mailer.default_url_options = {
    host: 'cursoscetem.herokuapp.com'
  }
end
