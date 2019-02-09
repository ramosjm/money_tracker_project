require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/tag.rb')

get '/merchants/' do
  erb(:index)
end

get '/merchants/:id' do
  erb(:show)
end

get '/merchants/new' do
  erb(:new)
end

post '/merchants' do
  #save merchant here
  erb(:create)
end

get '/merchants/:id/edit' do
  #use find method
  erb(:edit)
end

post '/merchants/:id' do
  #use update method
  redirect to '/merchants/'
end

post '/merchants/:id/delete' do
  # use find(id) and .Delete
  redirect to '/merchants/'
end
