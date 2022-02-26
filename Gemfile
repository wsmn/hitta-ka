source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.7.1"
gem "rails", "~> 6.0"

gem "aws-sdk-s3", require: false
gem "bootsnap"
gem "clearance" # Authentication
gem "font-awesome-sass"
gem "geocoder"
gem "grover"
gem "honeybadger", "~> 4.11"
gem "mini_magick"
gem "pagy"
gem "pg"
gem "puma", "> 4.3.2"
gem "rack-attack"
gem "sassc-rails"
gem "textacular", "~> 5.5"
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

group :development, :test do
  gem "bullet"
  gem "blinka-reporter", "~> 0.6.0"
  gem "capybara", "~> 3.36"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
  gem "webdrivers", require: false
  gem "selenium-webdriver"
end

group :development do
  gem "htmlbeautifier", require: false
  gem "letter_opener"
  gem "rails_real_favicon"
  gem "solargraph", require: false
  gem "standard", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
