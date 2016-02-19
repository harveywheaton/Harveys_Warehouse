# Homework Day 5 - library of tests for warehouse functions
# 
# Test environment set up
require ('minitest/autorun')
require_relative ('../warehouse_functions')



class TestMyFunctions < MiniTest::Test

def setup
 
    @warehouse_data = {
     b7: "bath fizzers",
     a3: "blouse",
     a7: "bookmark",
     c8: "candy wrapper"}
 

end


  # chalk         | c3
  # cookie jar    | b10
  # deodorant     | b9
  # drill press   | c2
  # face wash     | c6
  # glow stick    | a9
  # hanger        | a4
  # leg warmers   | c10
  # model car     | a8
  # nail filer    | b5
  # needle        | a1
  # paint brush   | c7
  # photo album   | b4
  # picture frame | b3
  # rubber band   | a10
  # rubber duck   | a5
  # rusty nail    | c1
  # sharpie       | b2
  # shoe lace     | c9
  # shovel        | a6
  # stop sign     | a2
  # thermometer   | c5
  # tyre swing    | b1
  # tissue box    | b8
  # tooth paste   | b6
  # word search   | c4

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

# Test to make sure we get nil if there is no such item
def test_cant_find_single_bay
  result = find_single_bay(@warehouse_data,"elephant")
  assert_equal(nil,result)
end

end