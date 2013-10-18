YOUR_APP_ID = 'e75d4bc3c02a9d489fac'
YOUR_APP_SECRET = 'eab7d6e8bced46c6fe6ec4ab9f47c679cb267a05'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, YOUR_APP_ID, YOUR_APP_SECRET
end