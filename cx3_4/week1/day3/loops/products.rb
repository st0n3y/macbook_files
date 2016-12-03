# PRODUCTS = {
#   guitar: 10,
#   blender: 8,
#   ipod: 9
# }

# for product in PRODUCTS.keys
#   if product == :guitar
#     puts PRODUCTS[product]
#   end
# end


NEW_PRODUCTS = [
  {name: "guitar", shelf: 10},
  {name: "blender", shelf: 5},
  {name: "ipod", shelf: 3}
]

# for product in NEW_PRODUCTS
#   if product[:name] == "blender"
#     puts product[:shelf]
#   end
# end

def get_shelf()
  puts "Enter product name: "
  product_name = gets.chomp.downcase
  for product in NEW_PRODUCTS
      if product[:name] == product_name
        return product[:shelf]
      end
    end
end


puts "That product is on shelf #{get_shelf()}."







