require( 'pg' )
require_relative( '../db/sql_runner.rb' )

class Album

  attr_accessor :id, :name, :artists_id

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @artists_id = options[ 'artists_id' ].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, artists_id) 
          VALUES ( '#{ @name }', #{ @artists_id } ) RETURNING *;"
    album = SqlRunner.run( sql ).first
    result = Album.new( album )
    return result
  end

  def artist()
    sql = "SELECT * FROM artists
          WHERE id = #{ @artists_id };"
    artist = SqlRunner.run( sql ).first
    result = Artist.new( artist )
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM albums 
          WHERE id = #{ id }"
    album = SqlRunner.run( sql ).first
    result = Album.new( album )
    return result
  end

end