h1.Clothes Retailer

A resposive 2 page website created for a clothing company which allows them to add products to a shopping cart, add vouchers (when necessary), edit the shopping cart and  filter through categories.

h2. Features

* Framework: Ruby On Rails
* Database: Postgres
* View Templates: ERB
* Stylesheets: SASS
* CSS Framework: Semantic UI
* Testing Framework: TODO
* Build system: TODO

h2. Development stack

* Framework: Ruby On Rails
* Database: Postgres
* View Templates: ERB
* Stylesheets: SASS
* CSS Framework: Semantic UI
* Testing Framework: TODO
* Build system: TODO

h2. Getting Started

# Assuming Rbenv
# @$rbenv install `cat .ruby-version`@
# @$gem install bundler
# @$bundle@
# @$rake db:setup@
# TODO @$rake test@
# Start server with @$bin/rails s@

h2. Deploy

The site is hosted on "Heroku":rmonline.herokuapp.com

TODO: (Pushing to the Github remote will trigger CI from "Codeship.io":https://www.codeship.io/projects/XXXXX and a deployment to Heroku.)

Runtime config:

@$heroku config@

* SOME_ENV

h2. Tests

TODO

Run the acceptance tests before you check in

# Start server with @$RAILS_ENV=test grunt@
# @$cucumber features@

h2. Relish

Sign off your story by documenting the acceptance tests in Cukes. Once you're happy and you pushed the story to staging:

 @$relish push courseiam@

This pushes the feature files up to our "relish account":https://www.relishapp.com/msp/rm-online/docs.

