class OwnedPokemon

  attr_accessor :id, :pokemon_id, :trainer_id

  def initialize( options )
    @id = options[ 'id' ].to_i
    @pokemon_id = options[ 'pokemon_id' ].to_i
    @trainer_id = options[ 'trainer_id' ].to_i
  end

  def save()
    sql = "INSERT INTO ownedpokemons (
          pokemon_id, 
          trainer_id )
          VALUES ( #{ @pokemon_id }, 
          #{ @trainer_id } 
          ) RETURNING *;"

    return OwnedPokemon.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM ownedpokemons;"
    
    return OwnedPokemon.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM ownedpokemons;"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
    owned_pokemon = SqlRunner.run(sql)
    result = ownedpokemons.map { |owned_pokemon| OwnedPokemon.new( owned_pokemon ) }
    
    return result
  end

  def self.map_item(sql)
    result = OwnedPokemon.map_items(sql)
    
    return result.first
  end

end