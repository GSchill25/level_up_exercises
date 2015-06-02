Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stackexchange, "4968", "QFvJnCM)zMl6nbRjZrs2Fw((", public_key: "*2tWYfPdWvmmTxEYbo9xAA((", site: 'stackoverflow'
end