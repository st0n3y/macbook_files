require( 'pry-byebug' )
require( 'pg' )

class Pizza

  attr_accessor( :first_name, :last_name, :topping, :quantity )

  def initialize( options ) #Options are entered as a hash. The values are then assigned to instance variables.
    @id = options[ 'id' ].to_i
    @first_name = options[ 'first_name' ]
    @last_name = options[ 'last_name' ]
    @topping = options[ 'topping' ]
    @quantity = options[ 'quantity' ].to_i
  end

  def save()
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
    sql = "INSERT INTO pizzas (
      first_name,
      last_name,
      topping,
      quantity ) VALUES (
      '#{ @first_name }',
      '#{ @last_name }',
      '#{ @topping }',
      #{ @quantity }
      );"

      db.exec( sql )
      db.close()
  end

  def self.all() #self stands in for Pizza
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
    sql = "SELECT * FROM pizzas;"
    
    pizzas = db.exec( sql )
    db.close()
    return pizzas.map { |pizza| Pizza.new( pizza ) }
  end

  def update()
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
    sql = "UPDATE pizzas 
            SET first_name = '#{@first_name}',last_name = '#{@last_name}', 
              topping = '#{@topping}', 
              quantity = #{@quantity}
          WHERE id = #{@id};"

    db.exec( sql )
    db.close()
  end

  # def self.update ( change, to, id )
  #   db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
  #   sql = "UPDATE pizzas SET '#{change}' = '#{to}' WHERE id = #{id};"
  
  #   new_pizza = db.exec( sql )
  #   db.close()
  # end

  def delete()
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
    sql = "DELETE FROM pizzas WHERE id = #{@id};"

    db.exec( sql )
    db.close()
  end

end