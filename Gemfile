source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.7.0"
gem "rails", "~> 6.0"

gem "aws-sdk-s3"
gem "bootsnap"
gem "clearance" # Authentication
gem "font-awesome-sass"
gem "geocoder"
gem "honeybadger", "~> 4.0"
gem "mini_magick"
gem "pagy"
gem "pg"
gem "puma", "> 4.3.2"
gem "rack-attack"
gem "sass-rails"
gem "simple_form"
gem "textacular", "~> 5.2"
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "webpacker"
gem "wicked_pdf"

group :production do
  gem "wkhtmltopdf-heroku", github: "gregnavis/wkhtmltopdf-heroku", ref: '67460ad9cff3c871d6247d6d6af35cca847223a9'
end

group :development, :test do
  gem "bullet"
  gem "capybara", "~> 3.32"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "wkhtmltopdf-binary"
end

group :development do
  gem "htmlbeautifier", require: false
  gem "rails_real_favicon"
  gem "solargraph", require: false
  gem "standardrb", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
