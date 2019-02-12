require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/user.rb')
also_reload('../models/*')


get'/users/' do
 @users = User.all
 erb(:"user/index")
end

get'/users/new/' do
  erb(:"user/new")
end

post '/users/new/' do
  @user = User.new(params)
  @user.save
  erb(:"user/create")
end

get '/users/:id' do
  erb(:"user/show")
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb(:"user/edit")
end

post '/users/:id/edit' do
  User.new(params).update
  redirect to '/users/'
end

post '/users/:id/delete' do
  user = user.find(params[:id])
  user.delete
  redirect to '/users/'
end
