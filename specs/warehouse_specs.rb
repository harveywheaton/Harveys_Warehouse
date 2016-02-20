# Homework Day 5 - library of tests for warehouse functions
# 
# Test environment set up
require ('minitest/autorun')
require_relative ('../warehouse_functions')



class TestMyFunctions < MiniTest::Test

def setup
 
    @warehouse_data = {

      b7: {item: "bath fizzers", position: 27},
      a3: {item: "blouse", position: 8},
      a7: {item: "bookmark",position:4},
      c8: {item:"candy wrapper",position:18},
      c3: {item:"chalk",position:13},
      b10: {item:"cookie jar",position:30},
      b9: {item:"deodorant",position:29},
      c2: {item:"drill press",position:12},
      c6: {item:"face wash",position:16},
      a9: {item:"glow stick",position:2},
      a4: {item:"hanger",position:7},
      c10: {item:"leg warmers",position:20},
      a8: {item:"model car",position:3},     
      b5: {item:"nail filer",position:25},
      a1: {item:"needle",position:10},
      c7: {item:"paint brush",position:17},
      b4: {item:"photo album",position:24},
      b3: {item:"picture frame",position:23},
      a10: {item:"rubber band",position:1},
      a5: {item:"rubber duck",position:6},
      c1: {item:"rusty nail",position:11},
      b2: {item:"sharpie",position:22},
      c9: {item:"shoe lace",position:19},
      a6: {item:"shovel",position:5},
      a2: {item:"stop sign",position:9},
      c5: {item:"thermometer",position:15},
      b1: {item:"tyre swing",position:21},
      b8: {item:"tissue box",position:28},
      b6: {item:"tooth paste",position:26},
      c4: {item:"word search",position:14}
}

end


  
# Test to see if we can get an item given its bay
def test_find_single_item

  result=find_single_item(@warehouse_data, :b7)
  assert_equal("bath fizzers",result)
  
end

# Test to make sure we get nil if we supply a non-existent bay
def test_cant_find_single_item

  result=find_single_item(@warehouse_data, :zz)
  assert_equal(nil,result)
  
end

# Test to see if we can get a bay for an existing item
def test_find_single_bay
  result = find_single_bay(@warehouse_data,"blouse")
  assert_equal(:a3,result)
end

# # Test to make sure we get nil if there is no such item
def test_cant_find_single_bay
  result = find_single_bay(@warehouse_data,"elephant")
  assert_equal(nil,result)
end

# # test to return multiple items given mutiple bays
def test_find_mutiple_items
  result = find_multiple_items(@warehouse_data,[:b7, :a3, :a7])
  assert_equal(["bath fizzers","blouse","bookmark"],result)

end

# test to return mutiple keys (bays) given multiple items
def test_find_multiple_bays
  result = find_multiple_bays(@warehouse_data,["bath fizzers","blouse","bookmark"])
  assert_equal([:b7, :a3, :a7],result)
end

def test_find_items_and_distance_apart
  result = find_multiple_items_and_distance(@warehouse_data,[:b5,:b10,:b6])
  assert_equal({:items=>["nail filer", "cookie jar","tooth paste"],:distance=>5},result)
end


# test to return mutiple keys (bays) given multiple items and also calculate distance between furthest bays

# def test_find_bays_and_distance_apart
#   result = find_multiple_bays_and_distance(@warehouse_data,["bath fizzers","blouse","bookmark"])
#   assert_equal({:bays=>[:b5, :a3, :a7],:distance=>23},result)
# end


end