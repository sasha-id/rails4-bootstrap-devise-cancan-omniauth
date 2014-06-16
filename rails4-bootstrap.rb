### Initial setup
remove_file 'config/database.yml'
remove_file 'app/assets/stylesheets/application.css'
remove_file 'app/controllers/application_controller.rb'
remove_file 'app/views/layouts/application.html.erb'
remove_file 'db/seeds.rb'
environment 'config.action_mailer.default_url_options = {host: "localhost:3000"}', env: 'development'


### Disable active record
gsub_file 'config/application.rb', "require 'rails/all'" do
<<-eos
#require 'rails/all'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
#require 'rails/test_unit/railtie'
require 'sprockets/railtie'


eos
end

gsub_file 'config/environments/development.rb', 'config.active_record', '#config.active_record'
gsub_file 'config/environments/production.rb', 'config.active_record', '#config.active_record'

### Gems
remove_file 'Gemfile'
create_file 'Gemfile'
add_source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem "mongoid", github: "mongoid/mongoid"

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'


gem_group :development do
  gem "guard-rspec"
  gem "pry"
  gem "quiet_assets"
  gem "thin"
end

gem_group :development, :test do
  gem "zeus"
  gem "rspec-rails"
  gem "factory_girl_rails"
end

gem_group :test do
  gem "mongoid-rspec"
  gem "ffaker"
  gem "simplecov", require: false
  gem "database_cleaner"
  gem "rb-inotify", "~> 0.9"
end

gem "bootstrap-sass", "~> 2.3.2.1"
gem "font-awesome-sass-rails"
gem "simple_form", github: "plataformatec/simple_form"
gem "devise", "~> 3.0.0"
gem "cancan"
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "hashugar", github: "alex-klepa/hashugar"

run 'bundle install'

### Generators
generate 'mongoid:config'
generate 'simple_form:install --bootstrap'
generate 'devise:install'
generate :controller, "home index"

### Routes
route 'resources :users'
route <<-eos

  devise_for :users, controllers: {
    registrations: "users/registrations", 
    passwords: "users/passwords", 
    omniauth_callbacks: "users/omniauth_callbacks"
  }
eos
route <<-eos

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root to: "home#index"
  end
eos

### Simple form
inject_into_file 'config/initializers/simple_form_bootstrap.rb', after: 'SimpleForm.setup do |config|' do
  <<-eos

  config.wrappers :inline_checkbox, :tag => 'div', :class => 'control-group', :error_class => 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper :tag => 'div', :class => 'controls' do |ba|
      ba.use :label_input, :class => 'checkbox inline'
      ba.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
      ba.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
    end
  end
  eos
end

### Bootstrap JS
inject_into_file "app/assets/javascripts/application.js", "//= require bootstrap\n", before: '//= require_tree'

### Devise OmniAuth providers config
inject_into_file 'config/initializers/devise.rb', after: /# config.omniauth .*?\n/ do
  <<-eos
  config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: 'email,user_birthday,read_stream'
  config.omniauth :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  eos
end

### Download misc files
source_url = 'https://raw.github.com/alex-klepa/rails4-bootstrap-devise-cancan-omniauth/master'
get "#{source_url}/app/assets/javascripts/users.js.coffee",                   'app/assets/javascripts/users.js.coffee'
get "#{source_url}/app/assets/stylesheets/application.css.scss",              'app/assets/stylesheets/application.css.scss'
get "#{source_url}/app/assets/stylesheets/bootstrap_and_overrides.css.scss",  'app/assets/stylesheets/bootstrap_and_overrides.css.scss'
get "#{source_url}/app/assets/stylesheets/users.css.scss",                    'app/assets/stylesheets/users.css.scss'
get "#{source_url}/app/controllers/users/omniauth_callbacks_controller.rb",   'app/controllers/users/omniauth_callbacks_controller.rb'
get "#{source_url}/app/controllers/users/passwords_controller.rb",            'app/controllers/users/passwords_controller.rb'
get "#{source_url}/app/controllers/users/registrations_controller.rb",        'app/controllers/users/registrations_controller.rb'
get "#{source_url}/app/controllers/users_controller.rb",                      'app/controllers/users_controller.rb'
get "#{source_url}/app/helpers/users_helper.rb",                              'app/helpers/users_helper.rb'
get "#{source_url}/app/models/ability.rb",                                    'app/models/ability.rb'
get "#{source_url}/app/models/identity.rb",                                   'app/models/identity.rb'
get "#{source_url}/app/models/user.rb",                                       'app/models/user.rb'
get "#{source_url}/app/models/user/auth_definitions.rb",                      'app/models/user/auth_definitions.rb'
get "#{source_url}/app/models/user/roles.rb",                                 'app/models/user/roles.rb'
get "#{source_url}/app/views/devise/unlocks/new.html.erb",                    'app/views/devise/unlocks/new.html.erb'
get "#{source_url}/app/views/devise/registrations/edit.html.erb",             'app/views/devise/registrations/edit.html.erb'
get "#{source_url}/app/views/devise/registrations/new.html.erb",              'app/views/devise/registrations/new.html.erb'
get "#{source_url}/app/views/devise/sessions/new.html.erb",                   'app/views/devise/sessions/new.html.erb'
get "#{source_url}/app/views/devise/passwords/edit.html.erb",                 'app/views/devise/passwords/edit.html.erb'
get "#{source_url}/app/views/devise/passwords/new.html.erb",                  'app/views/devise/passwords/new.html.erb'
get "#{source_url}/app/views/devise/confirmations/new.html.erb",              'app/views/devise/confirmations/new.html.erb'
get "#{source_url}/app/views/devise/shared/_links.erb",                       'app/views/devise/shared/_links.erb'
get "#{source_url}/app/views/layouts/_messages.html.erb",                     'app/views/layouts/_messages.html.erb'
get "#{source_url}/app/views/layouts/_navigation.html.erb",                   'app/views/layouts/_navigation.html.erb'
get "#{source_url}/app/views/users/index.html.erb",                           'app/views/users/index.html.erb'
get "#{source_url}/app/views/users/show.html.erb",                            'app/views/users/show.html.erb'
get "#{source_url}/app/views/users/_user.html.erb",                           'app/views/users/_user.html.erb'
get "#{source_url}/config/config.yml",                                        'config/config.yml'
get "#{source_url}/config/initializers/load_config.rb",                       'config/initializers/load_config.rb'
get "#{source_url}/app/controllers/application_controller.rb",                'app/controllers/application_controller.rb'
get "#{source_url}/app/views/layouts/application.html.erb",                   'app/views/layouts/application.html.erb'
get "#{source_url}/db/seeds.rb",                                              'db/seeds.rb'
get "#{source_url}/custom_plan.rb",                                           'custom_plan.rb'
get "#{source_url}/zeus.json",                                                'zeus.json'
get "#{source_url}/spec/spec_helper.rb",                                      'spec/spec_helper.rb'
get "#{source_url}/Guardfile",                                                'Guardfile'
get "#{source_url}/.rspec",                                                   '.rspec'
