# Homework Day 5 - library of tests for warehouse functions
# 
# Test environment set up
require ('minitest/autorun')
require_relative ('../warehouse_functions')


class TestMyFunctions < MiniTest::Test

#------------------------------------------
# Set up all the warehouse data
def setup
 
    @warehouse_data = {

      b7: {item: "bath fizzers", position: 27, weight:3},
      a3: {item: "blouse", position: 8, weight:1},
      a7: {item: "bookmark",position:4, weight:1},
      c8: {item:"candy wrapper",position:18, weight:1},
      c3: {item:"chalk",position:13, weight:1},
      b10: {item:"cookie jar",position:30, weight:5},
      b9: {item:"deodorant",position:29, weight:2},
      c2: {item:"drill press",position:12, weight:10},
      c6: {item:"face wash",position:16, weight:3},
      a9: {item:"glow stick",position:2, weight:2},
      a4: {item:"hanger",position:7, weight:2},
      c10: {item:"leg warmers",position:20, weight:3},
      a8: {item:"model car",position:3, weight:2},     
      b5: {item:"nail filer",position:25, weight:1},
      a1: {item:"needle",position:10, weight:1},
      c7: {item:"paint brush",position:17, weight:2},
      b4: {item:"photo album",position:24, weight:4},
      b3: {item:"picture frame",position:23, weight:5},
      a10: {item:"rubber band",position:1, weight:1},
      a5: {item:"rubber duck",position:6, weight:2},
      c1: {item:"rusty nail",position:11, weight:1},
      b2: {item:"sharpie",position:22, weight:1},
      c9: {item:"shoe lace",position:19, weight:1},
      a6: {item:"shovel",position:5, weight:8},
      a2: {item:"stop sign",position:9, weight:10},
      c5: {item:"thermometer",position:15, weight:2},
      b1: {item:"tyre swing",position:21, weight:15},
      b8: {item:"tissue box",position:28, weight:3},
      b6: {item:"tooth paste",position:26, weight:2},
      c4: {item:"word search",position:14, weight:2}
}

end


#------------------------------------------
# Test to see if we can get an item given its bay
def test_find_single_item

  result=find_single_item(@warehouse_data, :b7)
  assert_equal("bath fizzers",result)
  
end

#------------------------------------------
# Test to make sure we get nil if we supply a non-existent bay
def test_cant_find_single_item

  result=find_single_item(@warehouse_data, :zz)
  assert_equal(nil,result)
  
end

#------------------------------------------
# Test to see if we can get a bay for an existing item
def test_find_single_bay
  result = find_single_bay(@warehouse_data,"blouse")
  assert_equal(:a3,result)
end

#------------------------------------------
# Test to make sure we get nil if there is no such item
def test_cant_find_single_bay
  result = find_single_bay(@warehouse_data,"elephant")
  assert_equal(nil,result)
end

#------------------------------------------
# test to return multiple items given mutiple bays
def test_find_mutiple_items
  result = find_multiple_items(@warehouse_data,[:b7, :a3, :a7])
  assert_equal(["bath fizzers","blouse","bookmark"],result)

end


#------------------------------------------
# test to return mutiple keys (bays) given multiple items
def test_find_multiple_bays
  result = find_multiple_bays(@warehouse_data,["bath fizzers","blouse","bookmark"])
  assert_equal([:b7, :a3, :a7],result)
end


#------------------------------------------
def test_find_items_and_distance_apart
  result = find_multiple_items_and_distance(@warehouse_data,[:b5,:b10,:b6])
  assert_equal({:items=>["nail filer", "cookie jar","tooth paste"],:distance=>5},result)
end


#------------------------------------------
# test to return mutiple keys (bays) given multiple items and also calculate distance between furthest bays

def test_find_bays_and_distance_apart
result = find_multiple_bays_and_distance(@warehouse_data,["bath fizzers","blouse","bookmark"])
assert_equal({:bays=>[:b7, :a3, :a7],:distance=>23},result)
end


#------------------------------------------
# test to return list of bays for multiple items in order that items need to be collected

def test_find_bays_and_picking_order
  result = find_bays_and_picking_order(@warehouse_data,["shoe lace", "rusty nail", "leg warmers"])
  assert_equal([:c1, :c9, :c10],result)
end

# ADDITIONAL FUNCTIONS

#------------------------------------------
# test to return the weight of all items in a list of bays
def test_weight_of_items_in_bays
    result = weight_of_items_in_bays(@warehouse_data,[:c7,:b4,:b3])
    assert_equal(11,result)

end





end