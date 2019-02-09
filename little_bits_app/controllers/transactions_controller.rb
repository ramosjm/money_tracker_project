require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/transactions/:id' do
  erb(:show)
end

get '/transactions/new' do
  erb(:new)
end

post '/transactions/' do
  #save merchant here
  erb(:create)
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb(:"transaction/edit")
end

post '/transactions/:id' do
  #use update method
  redirect to '/'
end

post '/transactions/:id/delete' do
  # use find(id) and .Delete
  redirect to '/'
end
