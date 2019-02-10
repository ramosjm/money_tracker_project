require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/tag.rb')
also_reload('../models/*')

get '/tags/' do
  @tags = Tag.all
  erb(:"tag/index")
end

get '/tags/:id' do
  erb(:"tag/show")
end

get '/tags/new' do
  erb(:"tag/new")
end

post '/tags/new' do
  @tag = Tag.new(params)
  @tag.save
  erb(:"tag/create")
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
