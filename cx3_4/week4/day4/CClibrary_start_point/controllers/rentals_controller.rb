require_relative( '../models/rental.rb' )

#INDEX
get '/rentals' do
  @rentals = Rental.all()
  erb( :'rentals/index')
end

#NEW
get '/rentals/new' do
  @books = Book.all()
  @members = Member.all()
  erb( :'rentals/new' )
end

#CREATE
post '/rentals' do
  # binding.pry
  # params        #A useful way to find bugs.
  @rental = Rental.new( params )
  @rental.save()
  redirect to('/rentals')
end