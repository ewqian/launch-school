#def reverse!(arr)
#  arr_copy = Array.new(arr)
#  idx = 0
#  (0..(arr.length/2 - 1)).each do |idx|
#    arr[idx] = arr_copy[arr_copy.length - idx - 1]
#    arr[arr.length - idx - 1] = arr_copy[idx]
#  end
#  arr
#end

def reverse!(arr)
  arr_copy = Array.new(arr)
  arr.map! { arr_copy.pop }
end

def reverse(arr)
  arr.each_with_object([]) do |val, ret_arr|
    ret_arr.prepend(val)
  end
end

list = [1,2,3,4]
result = reverse!(list)
#p result == [4, 3, 2, 1] # true
#p list == [4, 3, 2, 1] # true
#p list.object_id == result.object_id # true

list = %w(a b e d c)
#p reverse!(list) == ["c", "d", "e", "b", "a"] # true
#p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
#p reverse!(list) == ["abc"] # true
#p list == ["abc"] # true

list = []
#p reverse!(list) == [] # true
#p list == [] # true

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true