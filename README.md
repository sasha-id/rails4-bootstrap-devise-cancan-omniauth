# Rails 4.0 App with Mongoid, Devise, CanCan, OmniAuth and Twitter Bootstrap (TDD ready)
---

You can use this project as a starting point for a Rails web application. It requires Rails 4 uses Mongoid as database, Devise/OmniAuth for user management and authentication, CanCan for user access control, and Twitter Bootstrap for CSS styling.

[Rails 4.0 Bootstrap Demo App](http://rails4-bootstrap.klepa.co/)

## How to use

* Install rails 4: `gem install rails`
* Generate new rails app from template: 

```
rails new myapp --skip-bundle -m https://raw.github.com/alex-klepa/rails4-bootstrap-devise-cancan-omniauth/master/rails4-bootstrap.rb
```
* `cd myapp`
* Edit `db/seed.rb` to customimze admin user settings then run `rake db:seed` to create admin user
* Edit `config/initializers/devise.rb` to customize your omniauth providers:

```ruby
config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: 'email,user_birthday,read_stream'
config.omniauth :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
```
* Edit `config/config.yml` to customize your application settings, they will be avaliable via `AppConfig` object within your app, e.g. `AppConfig.default_role`


##Test-driven development

* In 1st console start zeus: `zeus start`
* In 2nd start rails server: `zeus s`
* In 3rd start guard: `bundle exec guard`


---
### Links

[Devise](http://github.com/plataformatec/devise)

[OmniAuth](https://github.com/intridea/omniauth)

[CanCan](https://github.com/ryanb/cancan)

[Twitter Bootstrap](http://twitter.github.com/bootstrap/)

