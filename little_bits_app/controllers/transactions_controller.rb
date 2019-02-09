require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/transaction.rb')

get '/' do
  @transactions = Transaction.all()
  erb(:index)
end

get '/tags/:id' do
  erb(:show)
end

get '/tags/new' do
  erb(:new)
end

post '/tags' do
  #save merchant here
  erb(:create)
end

get '/tags/:id/edit' do
  #use find method
  erb(:edit)
end

post '/tags/:id' do
  #use update method
  redirect to '/tags/'
end

post '/tags/:id/delete' do
  # use find(id) and .Delete
  redirect to '/tags/'
end
