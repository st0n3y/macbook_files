require( 'pg' )
require_relative( '../db/sql_runner.rb' )
require_relative( './album.rb' )

class Artist

  attr_accessor :id, :name

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
  end

  def save()
    sql = "INSERT INTO artists (name) 
          VALUES ( '#{ @name }' ) RETURNING *;"
    artist = SqlRunner.run( sql ).first
    result = Artist.new( artist )
    return result
  end

  def albums()
    sql = "SELECT * FROM albums
          WHERE artists_id = #{ @id };"
    albums = SqlRunner.run( sql )
    result = albums.map { |album| Album.new( album ) }
    return result
  end

end