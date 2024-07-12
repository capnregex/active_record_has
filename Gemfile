# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in active_record_has.gemspec
gemspec

ruby "3.3.3"

gem "bootsnap", require: false
gem "puma"
gem "rails", ">= 7.1"
gem "rake"
gem "sqlite3", "~> 1.4"
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "data_imp"
  gem "debug", platforms: %i[mri windows]
  gem "rspec-rails"
  gem "rubocop"
end

group :development do
  gem "web-console"
end
