web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -c 5 -v
assets: bundle exec rake assets:precompile
clock: bundle exec clockwork lib/clock.rb