Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["COMPETENCY_TRACKER_GOOGLE_CLIENT_ID"], ENV["COMPETENCY_TRACKER_GOOGLE_CLIENT_SECRET"]
end
