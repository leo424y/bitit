source 'https://rubygems.org'

gem 'rack-cors', :require => 'rack/cors'

gem 'paranoia'
gem 'activeadmin'
gem 'friendly_id', '~> 5.1.0'

gem 'meta-tags'

# gem 'rails-erd'

gem 'inline_svg'
gem 'omniauth-facebook'
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'react-rails'
gem 'masonry-rails', '~> 0.2.4'
# gem 'paperclip', '~> 5.0' 圖片上傳
gem 'haml', '~> 4.0', '>= 4.0.7'
gem 'social-share-button'
gem 'virtual_keyboard'
gem 'rails-i18n'
gem 'devise'
gem 'pundit'
gem 'carrierwave'
gem 'country_select'
gem 'mini_magick'
gem 'sunspot_rails'

gem 'bootstrap-sass'
gem 'simple_form'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'better_errors'
  gem 'bullet'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'sqlite3'
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # 測試用gem信不會寄出，config.action_mailer.delivery_method = :letter_opener
  gem 'letter_opener'

  gem 'sunspot_solr'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
