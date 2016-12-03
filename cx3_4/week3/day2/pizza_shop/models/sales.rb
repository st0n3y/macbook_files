class Sales

  def initialize( pizzas )
    @pizzas = pizzas
  end

  def total_revenue()
    total = 0
    for pizza in @pizzas
      total += (pizza.quantity * 10)
    end
    return total
    # Alternative way using block:
    # @pizzas.inject(0) { |sum, pizza| sum + pizza.quantity } * 10
  end

end