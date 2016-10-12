Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :linkedin, ENV['NYCTOCLUB_LINKEDIN_ID'], ENV['NYCTOCLUB_LINKEDIN_SECRET'],
           :fields => ['id', 'email-address', 'first-name', 'last-name', 'headline', 'picture-url', 'public-profile-url']
  provider :google_oauth2, ENV["NYCTOCLUB_GOOGLE_CLIENT_ID"], ENV["NYCTOCLUB_GOOGLE_CLIENT_SECRET"],
           :scope => ['https://docs.google.com/feeds/']
end
