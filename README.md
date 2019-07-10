# Kontrollansvarig - a search index for inspectors!

## Getting started
The application is written in Ruby on Rails, download the repository and get started!

- Install `Ruby 2.6` ([rbenv](https://github.com/rbenv/rbenv#groom-your-apps-ruby-environment-with-rbenv))
- Install [`Postgres`](https://www.postgresql.org/download/)
- Install [`yarn`](https://yarnpkg.com/en/docs/install)
- Install [`bundler`](https://bundler.io)
- Run `bin/setup` inside this repository.

### Create user
- Run `rails console`
- In the console, input:
```ruby
User.create!(email: 'youremail@mail.com', role: :admin, password: 'your-new-password', name: 'You!')
```

## Status
[![CircleCI](https://circleci.com/gh/wesmn/hitta-ka/tree/master.svg?style=shield)](https://circleci.com/gh/wesmn/hitta-ka/tree/master)
