source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.0'
gem 'devise', '~> 4.2'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'jquery-rails' 
gem 'listen'
gem 'gritter', "1.2.0"
gem 'administrate'
gem 'bourbon'
gem 'pundit'
gem 'twilio-ruby', '~> 4.11', '>= 4.11.1'
gem 'kaminari'
gem 'rails_12factor'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'sqlite3'
  gem "better_errors"
  gem "binding_of_caller"
  
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
