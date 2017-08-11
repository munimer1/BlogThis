require './models'
require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/flash'


set :database, { adapter: "sqlite3", database: "development.sqlite3" }

enable :sessions


get '/' do
  erb :index
end
