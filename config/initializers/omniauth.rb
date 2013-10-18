# APP_ID = '2f457624a6b5fbae8c03'
# APP_SECRET = '8efff932356f70adbc75a1be60152fc591b5ad29'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, APP_ID, APP_SECRET
end