require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/transactions/:id' do
  erb(:show)
end

get '/transactions/new/' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transaction/new")
end

post '/transactions/new/' do
  @transaction = Transaction.new(params)
  @transaction.save
  erb(:"transaction/create")
  redirect to '/'
end

get '/transactions/:id/edit/' do
  @transaction = Transaction.find(params[:id])
  erb(:"transaction/edit")
end

post '/transactions/:id/' do
  #use update method
  redirect to '/'
end

post '/transactions/:id/delete/' do
  # use find(id) and .Delete
  redirect to '/'
end
