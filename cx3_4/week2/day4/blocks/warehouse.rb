PRODUCTS = [
  {bay: 'a10', name: "rubber band"},
  {bay: 'a9', name: "glowstick"},
  {bay: 'a8', name: "model car"},
  {bay: 'a7', name: "bookmark"},
  {bay: 'a6', name: "shovel"}
]

def return_item_at_bay( bay )
  found_item = PRODUCTS.find{ |item| item[:bay] == bay }
  found_item[:name]
end

def return_bay_for_item( item )
  found_bay = PRODUCTS.find{ |i| i[:name] == item }
  found_bay[:bay]
end

def return_items_for_bays( bays )
  return bays.map{ |bay| return_item_at_bay(bay) }
end

# Return the items at a given bay
# Return the bay for a given product
# Return the items for a given array of bays