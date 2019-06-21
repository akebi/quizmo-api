source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.3'

gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# password-hashing gem
gem 'bcrypt', '~> 3.1.7'

# JWT for authentication tokens
gem 'jwt'

# Thin
gem 'thin'

# CORS
gem 'rack-cors'

# MongoDB ODM
gem 'mongoid', '~> 7.0'
# Serialise Ruby types to BSON used ny mongodb
gem 'bson_ext', '~> 1.5.1'

# GraphQL for API
gem 'graphql', '~> 1.8.10'

group :development do
	# Call 'byebug' anywhere in the code to stop execution and get a debugger console
  	gem 'byebug'

  	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
 	gem 'spring'

	# Tools for graphql development in ruby
	gem 'graphiql-rails', '1.4.11'
end

group :test do
	gem 'rspec-rails', '~> 3.8'

	# MongoDB ODM rspec matchers
  	gem 'mongoid-rspec', '~> 4.0.1'

	# Generate fake data for seeds/fixtures
	gem 'faker', '~> 1.9.1'
end
