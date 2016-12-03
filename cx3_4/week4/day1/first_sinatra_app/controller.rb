require 'sinatra'
require 'sinatra/contrib/all' if development?
#Applies changes without restarting Sinatra, if in development mode (default).

get '/hi' do #get = method, '/hi' = route
  return "Hello, world! My first Sinatra app"
end

# get '/name' do
#   return "David"
# end

get '/address' do
  return "123 Fake Street"
end

get '/fav-book' do
  return "The Adventures of Huckleberry Finn"
end

get '/name/:title/:firstname/:lastname' do
  return "Your title is: #{params[:title]} #{params[:firstname]} #{params[:lastname]}."
end