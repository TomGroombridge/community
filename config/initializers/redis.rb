encoded_url = URI.encode(Rails.application.secrets.redistogo_url)
uri = URI.parse(encoded_url)
REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])

