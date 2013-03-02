# Rails 4.0 App with Mongoid, Devise, CanCan, OmniAuth and Twitter Bootstrap
---

You can use this project as a starting point for a Rails web application. It requires Rails 4 and uses Mongoid as database, Devise/OmniAuth for user management and authentication, CanCan for user access control, and Twitter Bootstrap for CSS styling.

[Rails 4.0 Bootstrap Demo App](http://rails4-bootstrap.klepa.co/)

## How to use

* Edit `db/seed.rb` to customimze admin user then run `rake db:seed`

* Edit `config/initializers/devise.rb` to customize your omniauth providers:

```ruby
config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: 'email,user_birthday,read_stream'
config.omniauth :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
```

* Edit `config/config.yml` to customize your application settings, they will be avaliable via `AppConfig` object within your app, e.g. `AppConfig.default_role`

---
### Links

[Devise](http://github.com/plataformatec/devise)

[OmniAuth](https://github.com/intridea/omniauth)

[CanCan](https://github.com/ryanb/cancan)

[Twitter Bootstrap](http://twitter.github.com/bootstrap/)

