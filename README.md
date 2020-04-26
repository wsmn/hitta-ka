# Kontrollansvarig - a search index for inspectors!

## Getting started
The application is written in Ruby on Rails, download the repository and get started!

- Install `Ruby 2.6` ([rbenv](https://github.com/rbenv/rbenv#groom-your-apps-ruby-environment-with-rbenv))
- Install [`Postgres`](https://www.postgresql.org/download/)
- Install [`yarn`](https://yarnpkg.com/en/docs/install)
- Install [`bundler`](https://bundler.io)
- Run `bin/setup` inside this repository.

### Install SSL for localhost
https://github.com/FiloSottile/mkcert
```
brew install mkcert
mkcert -install
cd config/ssl
mkcert example.com "*.example.com" example.test localhost 127.0.0.1 ::1
mv example.com+5-key.pem example-key.pem
mv example.com+5.pem example.pem
rails s

# In a different terminal
./bin/webpack-dev-server
```

Application should be available at `https://localhost:8443`.

### Webpack

If editing a lot of javascript code which needs to be recompiled, start the `webpack-dev-server` separately.
In a terminal separate from `rails s`:
```
./bin/webpack-dev-server
```

### Create user
- Run `rails console`
- In the console, input:
```ruby
User.create!(email: 'youremail@mail.com', role: :admin, password: 'your-new-password', name: 'You!')
```

### Create company
- Run 'rails console'
- In the console, input:
```
company = Company.new()
company.name = "Company AB"
company.address = { street: 'Road 1', postal_code: '11122', city: 'Small City', country: 'Sweden' }
company.slug = 'compab'
company.save!
```

## Status
![](https://github.com/wsmn/hitta-ka/workflows/Tests/badge.svg)
