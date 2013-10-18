Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['APP_ID'], ENV['APP_SECRET']
end