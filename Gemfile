# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'rake'
gem 'sinatra-flash'

group :development do
  gem 'sqlite3'
  gem 'pry'
end

group :production do
  gem 'pg'
end