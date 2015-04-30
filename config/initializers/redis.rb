encoded_url = URI.encode('redis://redistogo:92af4ff10756396e62e4c3e20b1d1d85@jack.redistogo.com:11477/')
uri = URI.parse(encoded_url)
REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])

