create new project:
1) touch .rvmrc
  inside - rvm 2.2@williamsl25_homework --create
2) go in and out in terminal
3) gem install rails
4) rails new . -d mysql (will auto make db mysql)
5) in database.yml - add adapter: mysql2 => add db name: name_db_development, name_db_production, name_db_test 
6) gemfile: add gems  
gem 'mysql2'
gem 'haml-rails'
gem 'faker'
gem 'quiet_assets'
gem 'devise'
gem 'workflow'
gem 'jquery-turbolinks'
7) bundle install
8) rake db:create
9) rails g controller welcome => def index
10) config => in routes.rb define root => root 'welcome#index'
11) user auth => 
  1) gem 'devise'
  2) bundle install
  3) rails s
  4) rails generate devise:install
  config=>environ=> add
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  5) Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  6) You can copy Devise views (for customization) to your app by running:
       rails g devise:views
12) BOOTSTRAP
  in vendor => assets add fonts, stylesheets, and javascript folders
  -  make sure glyphicons in the bootstrap.css file has '/assets/bootstrap/glyphicons all the way across
  -  add metatags to head =>
    %meta{:content => "IE=edge", "http-equiv" => "X-UA-Compatible"}/

    %meta{:content => "width=device-width, initial-scale=1", :name => "viewport"}/
  - in app => assets=> stylesheets=> application.css  add 
  = require bootstrap
  = require navbar-static-top or whatever bootstrap navbar
  - grab all of the html from bootstrap theme and paste into the views/layouts/app.html.haml
13) to add columns to an already existing model => migrate don't edit in db! In terminal
  rails g migration add_first_name_last_name_github_admin_status_to_users first_name:string last_name:string github:string admin_status:boolean

  or 
  rails g migration add_restaurant_id_to_foods restaurant_id :integer
  rake db:migrate
14) rake db:rollback if you make an error and want to rollback to an earlier migration
15)

# Homework-tracker
# Homework-tracker

testing-
in gemfile under group:development, :test do
gem 'rspec-rails', '~> 3.0'
rails generate rspec:install
spec folder - 
  This adds the following files which are used for configuration:
    .rspec
    spec/spec_helper.rb
    spec/rails_helper.rb 
create new folder for models:
  *to test assignment model - add a spec.rb file
    assignment_spec.rb
*to get the database to clear out after each test: 
1)install gem 'database_cleaner'
2)in spec/rails_helper
  change config.use_transactional_fixtures = true
  to false
3)then in the spec/rails_helper include:
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
*to get factory girl objects to be created  =>remove turbolinks gem from gemfile and the =require turbolinks in application.js as well in the layouts head-turbolinks links 