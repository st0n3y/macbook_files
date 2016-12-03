require_relative( 'models/pokemon.rb' )
require_relative( 'models/trainer.rb' )
require_relative( 'models/owned_pokemon.rb' )
require( 'pry-byebug' )

OwnedPokemon.delete_all()
Pokemon.delete_all()
Trainer.delete_all()

pokemon1 = Pokemon.new( { 'name' => 'Pikachu' } )
pokemon2 = Pokemon.new( { 'name' => 'Bulbasaur' } )
pokemon3 = Pokemon.new( { 'name' => 'Klefki' } )

p1 = pokemon1.save
p2 = pokemon2.save
p3 = pokemon3.save

trainer1 = Trainer.new( { 'name' => 'Ash' } )
trainer2 = Trainer.new( { 'name' => 'Misty' } )
trainer3 = Trainer.new( { 'name' => 'Brock' } )

t1 = trainer1.save
t2 = trainer2.save
t3 = trainer3.save

ownedpokemon1 = OwnedPokemon.new( { 'pokemon_id' => p1.id, 'trainer_id' => t1.id } )
ownedpokemon2 = OwnedPokemon.new( { 'pokemon_id' => p2.id, 'trainer_id' => t1.id } )
ownedpokemon3 = OwnedPokemon.new( { 'pokemon_id' => p3.id, 'trainer_id' => t3.id } )

o1 = ownedpokemon1.save
o2 = ownedpokemon2.save
o3 = ownedpokemon3.save

binding.pry
nil