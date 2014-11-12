OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '584095781694269', '69b4c95e1fcdb251a5f1569d1b7cf086'  
end