require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/books_controller')
require_relative('controllers/members_controller')
require_relative('controllers/rentals_controller')

get '/' do
  erb :home
end