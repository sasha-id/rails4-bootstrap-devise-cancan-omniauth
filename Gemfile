source "https://rubygems.org"

gem "rails", github: "rails/rails"
gem "mongoid", github: "mongoid/mongoid"
group :assets do
  gem "sprockets-rails", github: "rails/sprockets-rails"
  gem "sass-rails", github: "rails/sass-rails"
  gem "coffee-rails", github: "rails/coffee-rails"
  gem "therubyracer", platforms: :ruby
  gem "uglifier", ">= 1.0.3"
end

group :development do
  gem "guard-rspec"
  gem "pry"
  gem "quiet_assets"
  gem "thin"
end

group :development, :test do
  gem "zeus"
  gem "rspec-rails"
  gem "factory_girl_rails"
end

group :test do
  gem "mongoid-rspec"
  gem "ffaker"
  gem "simplecov", require: false
  gem "database_cleaner"
  gem "rb-inotify", "~> 0.9"
end

gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 1.0.1"
gem "bootstrap-sass", "~> 2.3.0.1"
gem "font-awesome-sass-rails"
gem "simple_form", github: "plataformatec/simple_form"
gem "devise", git: "https://github.com/plataformatec/devise.git", branch: "rails4"
gem "cancan"
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "hashugar", github: "alex-klepa/hashugar"