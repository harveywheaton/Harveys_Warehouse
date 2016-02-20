# Homework Day 5 - library of tests for warehouse functions
# 
# 

#-------------------------------------------
# Verify all values for 'position' in the data are unique
# This is critical to calculatig distance between bays
def verify_data_positions(hash)
  items = hash.values

  positions=Array.new
    for thing in items
      positions << thing[:position]
  end
  
  all_unique = true

  for value in positions
    if positions.count(value)>1
      print "Position " + value.to_s + " is not unique!"
      all_unique=false  
    end

  end
  
  return all_unique

end


#-------------------------------------------
# (1) Return a single item given the bay number
# Otherwise returns nil if bay not found
def find_single_item(hash,lookup)
  if hash[lookup]==nil
    return nil
  else
    return hash[lookup][:item]
  end
end


#-------------------------------------------
# (2) Return a single bay given an item
# Note that this will only return the first matching
# item found. If there are several items the same in
# different bays, only first found will be returned
def find_single_bay(hash,lookup)

  for key,value in hash

    if value[:item] == lookup
      return key 
    end
    
  end
  #If gone all the way throuh the hash, no item
  #found so return nil
  return nil
end


#-------------------------------------------
# (3) Return an array of items for an array of bays
def find_multiple_items(hash,bay_array)

  items=Array.new

  for key in bay_array
    items << hash[key][:item]
  end
  return items

end


#-------------------------------------------
# (4) Return an array of bays for an array of items
def find_multiple_bays(hash,item_array)
  bays=Array.new

  #loop round the array of items
  for item in item_array

    #for each item, go looking for a match
    for key,value in hash    

      if value[:item] == item
        #If we find a match, shovel into the return array
        bays << key
      end
    end

  end
  return bays

end



#-------------------------------------------
# (5a) Return an array of items for an array of bays
# and the distance between the furthest bays
def find_multiple_items_and_distance(hash,bay_array)

  #Step 1 - get the list of items for the bays
  items = find_multiple_items(hash,bay_array)
  
  #Step 2 - work out distance between furthest bays
  
  #Start by getting the position of the first bay
  #and assign this to nearest and furthest
  nearest_location=hash[bay_array[0]][:position]
  furthest_location=hash[bay_array[0]][:position]

  #Then look at all the other bays and work
  #out the one that is closest and one furthest  
  for value in bay_array
    if hash[value][:position]>furthest_location
      furthest_location = hash[value][:position]
    end
    if hash[value][:position]<nearest_location
      nearest_location = hash[value][:position]
    end

  end
  distance = furthest_location-nearest_location
  return {:items=>items,:distance=>distance}
end



# (5b) Return an array of bays for an array of items and the distance apart from furthest bays
def find_multiple_bays_and_distance(hash,item_array)

  #Step 1 - get the list of bays for the items
  bays = find_multiple_bays(hash,item_array)
  
  #Step 2 - work out distance between furthest bays
  
  #Start by getting the position of the first bay
  #and assign this to nearest and furthest

  nearest_location=hash[bays[0]][:position]
  furthest_location=hash[bays[0]][:position]

  #Then look at all the other bays and work
  #out the one that is closest and one furthest  
  for value in bays
    if hash[value][:position]>furthest_location
      furthest_location = hash[value][:position]
    end

    if hash[value][:position]<nearest_location
      nearest_location = hash[value][:position]
    end

  end
  distance = furthest_location-nearest_location
  return {:bays=>bays,:distance=>distance}
end


#-------------------------------------------
# For a list of items, return the order in which
#to pick them from the bays, from closest to furthest
def find_bays_and_picking_order(hash,item_array)

  #Step 1 - get the list of bays for the items
  bays = find_multiple_bays(hash,item_array)

  #Step 2, for each bay get the position
  ordered_hash = Hash.new
  for bay_id in bays
    ordered_hash[bay_id.to_sym]=hash[bay_id.to_sym][:position]
  end

  #Create an array from the hash, ordered by position of each bay
  ordered_nested_array= ordered_hash.sort_by { |bay, position| position }

  #Then use this to create the ordered list of bays  
  ordered_bays = Array.new
  for value in ordered_nested_array
    ordered_bays << value[0]

  end

  return ordered_bays

end

# ADDITIONAL FUNCTIONS
#-------------------------------------------
# For a list of bays, return the weight of all items in them
def weight_of_items_in_bays(hash,bay_array)
  weight = 0
  for bay in bay_array
    weight += hash[bay][:weight]
  end

  return weight

end

#-------------------------------------------
# Return a hash of items with count of how many
def stock_list(hash)
  
  # First build array of unique items
  stock=Array.new
  for key,value in hash
    unless stock.include?(value[:item])   
      stock << value[:item]
    end
  end
  

    # Then build array with each unique item and its count

    return_array = Array.new

    for stock_item in stock
      count_of_items = 0
      
      for key,value in hash

        if value[:item] == stock_item
          count_of_items += 1          
        end
      end

      return_array << [stock_item,count_of_items]

    end

  return return_array

end
