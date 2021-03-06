require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
also_reload('../models/*')


get '/tags/' do
  @tags = Tag.all
  @total = 0.00
  erb(:"tag/index")
end

get '/tags/new' do
  erb(:"tag/new")
end

get '/tags/:id/' do
  @tag = Tag.find(params[:id])
  @transactions = @tag.transaction
  @total = @tag.transaction_total(@tag.transaction)
  erb(:"tag/show")
end

post '/tags/new' do
  @tag = Tag.new(params)
  @tag.save
  erb(:"tag/create")
end

get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])
  erb(:"tag/edit")
end

post '/tags/:id' do
  Tag.new(params).update
  redirect to '/tags/'
end

post '/tags/:id/delete' do
  tag = Tag.find(params[:id])
  tag.delete
  redirect to '/tags/'
end
