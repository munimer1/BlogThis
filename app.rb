require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/flash'
require './models'
require 'pry'

set :database, { adapter: "sqlite3", database: "development.sqlite3" }

enable :sessions

def current_user
  @current_user ||= User.find_by_id(session[:user_id])
end

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.find_by(username: params[:user][:username])
  if user
    flash[:alert] = "That username is taken."
    redirect "/signup"
  elsif params[:user][:username].length < 2 || params[:user][:password].length < 2
    flash[:alert] = "Your username and password must be longer than two characters."
    redirect "/signup"
  else
    user = User.create(params[:user])
    session[:user_id] = user.id
    flash[:notice] = "Yay! You're signed up :)"
    redirect "/users/#{user.id}"
  end
end

get '/login' do
  erb :login
end

post '/login' do
 user = User.find_by(username: params[:user][:username])
 if user && user.password == params[:user][:password]
   session[:user_id] = user.id
   flash[:notice] = "Successfully logged in."
   redirect "/users/#{user.id}"
 else
   flash[:alert] = "Failed to log in."
   redirect '/login'
 end
end

get '/users/:id' do
  if current_user && current_user.id == params[:id].to_i
    erb :show
  else
    flash[:alert] = "Sorry, you can't go there."
    redirect '/'
  end
end

get '/logout' do
  session.clear
  flash[:notice] = "Byeeeeeee"
  redirect '/'
end
