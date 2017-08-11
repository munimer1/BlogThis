require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/flash'
require 'pry'
require './models'


set :database, { adapter: "sqlite3", database: "development.sqlite3" }

enable :sessions


get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end


post '/login' do
	user = User.find_by(username: params[:username])
	if user && user.password == params[:password]
		session[:user_id] = user.id
		redirect '/'
	else
		redirect '/signup'
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect '/signup'
end

post '/new_user' do
	User.create(username: params[:username], password: params[:password], city: params[:city], school: params[:school])
	redirect "/"
end
