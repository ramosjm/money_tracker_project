require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/merchants/' do
  @merchants = Merchant.all
  erb(:"merchant/index")
end

get '/merchants/:id/' do
  erb(:"merchant/show")
end

get '/merchants/new' do
  erb(:"merchant/new")
end

post '/merchants/new' do
  @merchant = Merchant.new(params)
  @merchant.save
  erb(:"merchant/create")
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
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
