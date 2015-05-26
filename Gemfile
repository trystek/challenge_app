source 'https://rubygems.org'

# core
gem 'rails', '4.1.1'
gem 'acts_as_votable'
gem 'carrierwave'
gem 'certified'
gem 'devise'
gem 'omniauth-github'
gem 'rmagick'

# frontend
gem 'slim-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

# doc
gem 'sdoc', '~> 0.4.0',          group: :doc

# development
group :development do
  gem 'spring'
  gem 'sqlite3'
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # windows
end

# production - heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# testing
group :test do
  gem "database_cleaner",   "~> 1.2.0"
  gem "capybara",           github: "jnicklas/capybara" # master until rspec3 fixes are released #~> 2.2.0"
  gem "poltergeist",        "~> 1.5.0"
  gem "factory_girl_rails", "~> 4.2.0"
  gem "cucumber-rails",     "~> 1.4.1", require: false
  gem "factory_girl"
  gem "rspec-rails"
end
