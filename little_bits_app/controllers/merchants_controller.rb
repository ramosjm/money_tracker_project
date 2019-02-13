require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
also_reload('../models/*')

get '/merchants/' do
  @merchants = Merchant.all
  erb(:"merchant/index")
end

get '/merchants/new' do
  erb(:"merchant/new")
end

get '/merchants/:id/' do
  @merchant = Merchant.find(params['id'])
  @transactions = @merchant.transaction
  @total = Transaction.total_transactions(@transactions)
  erb(:"merchant/show")
end

post '/merchants/new' do
  @merchant = Merchant.new(params)
  @merchant.save
  erb(:"merchant/create")
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params['id'])
  erb(:"merchant/edit")
end

post '/merchants/:id' do
  Merchant.new(params).update
  redirect to '/merchants/'
end

post '/merchants/:id/delete/' do
  merchant = Merchant.find(params[:id])
  merchant.delete()
  redirect to '/merchants/'
end
