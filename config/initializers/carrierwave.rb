if Rails.env.production?
	CarrierWave.configure do |config|
	  config.fog_credentials = {
    	:provider              => 'AWS',
	    :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
	    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
	    :region                => "eu-west-1",
	  }
	  config.storage = :fog
	  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
	  config.fog_directory    = "staging-courseima"
	end
elsif Rails.env.staging?
	CarrierWave.configure do |config|
	  config.fog_credentials = {
    	:provider              => 'AWS',
	    :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
	    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
	    :region                => "eu-west-1",
	  }
	  config.storage = :fog
	  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
	  config.fog_directory    = "staging-courseima"
	end
# else
# 	CarrierWave.configure do |config|
# 	  config.fog_credentials = {
# 	    :provider              => 'AWS',
# 	    :aws_access_key_id     => Rails.application.secrets.aws_access_key_id,
# 	    :aws_secret_access_key => Rails.application.secrets.aws_secret_access_key,
# 	    :region                => "eu-west-1"
# 	  }
# 	  if Rails.env.test? || Rails.env.cucumber?
# 	    config.storage = :file
# 	    config.enable_processing = false
# 	    config.root = "#{Rails.root}/tmp"
# 	  else
# 	    config.storage = :fog
# 	  end
# 	  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
# 	  config.fog_directory    = "staging-courseima"
# 	end
end