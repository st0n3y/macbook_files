require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry-byebug'
require_relative './models/pizza.rb'

get '/pizzas/new' do
  erb(:new)
end

get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index) #Passes data from controller to view
end

post '/pizzas' do #Must be same as route in erb file form action
  # binding.pry
  @pizza = Pizza.new(params) #Must use params
  @pizza.save
  erb(:create)
end