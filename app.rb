require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/flash'

require './models'


set :database, { adapter: "sqlite3", database: "development.sqlite3" }

enable :sessions
