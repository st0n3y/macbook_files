require 'pg'

class Pizza

  attr_reader :first_name, :last_name, :topping, :quantity, :id

  def initialize(options)
    @id = nil || options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @topping = options['topping']
    @quantity = options['quantity'].to_i
  end

  def pretty_name()
    return @first_name + " " + @last_name
  end

  def save()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "INSERT INTO pizzas (
      first_name,
      last_name,
      topping,
      quantity
    )
    VALUES (
      '#{@first_name}',
      '#{@last_name}',
      '#{@topping}',
      #{@quantity}
    )"
    db.exec(sql)
    db.close
  end


  def self.find( id )
   db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
   sql = "SELECT * FROM pizzas WHERE id = #{id};"
   result = db.exec(sql)
   pizza = Pizza.new(result.first)
   db.close
   return pizza
  end

  def self.all()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "SELECT * FROM pizzas;"
    pizzas = db.exec(sql)
    result = pizzas.map {|pizza| Pizza.new(pizza)}
    db.close
    return result
  end

  def self.update( options )
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "UPDATE pizzas SET
          first_name = '#{options['first_name']}',
          last_name = '#{options['last_name']}',
          topping = '#{options['topping']}',
          quantity = #{options['quantity']}
          WHERE id = #{options['id']}
          "
    db.exec( sql )
    db.close
  end

  def self.destroy( id )
    db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'} )
    sql = "DELETE FROM pizzas
          WHERE id = #{id}
          "

    db.exec( sql )
    db.close
  end

end