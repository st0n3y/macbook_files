require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry-byebug'
require_relative './models/pizza.rb'

get '/pizzas/new' do
  #NEW
  erb(:new)
end

get '/pizzas' do
  #INDEX
  @pizzas = Pizza.all()
  erb(:index) #Passes data from controller to view
end 

post '/pizzas' do #Must be same as route in index.erb  form action
  #CREATE
  @pizza = Pizza.new( params ) #Must use params
  @pizza.save
  erb(:create)
end

get '/pizzas/:id' do
  #SHOW
  @pizza = Pizza.find( params[:id] )
  erb(:show)
end

get '/pizzas/:id/edit' do
  #EDIT
  @pizza = Pizza.find( params[:id] )
  erb(:edit)
end

put '/pizzas/:id' do
  #UPDATE
  @pizza = Pizza.update( params )
  redirect to( "/pizzas/#{params[:id]}" )
end

delete '/pizzas/:id' do
  #DELETE
  Pizza.destroy( params[:id] )
  redirect to( '/pizzas' )
end