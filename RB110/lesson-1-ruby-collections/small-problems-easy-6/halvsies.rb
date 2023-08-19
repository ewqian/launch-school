def halvsies(arr)
  limit = arr.length.odd? ? arr.length/2 : arr.length/2 - 1
  [arr.select { |val| arr.index(val) <= limit }, arr.select { |val| arr.index(val) > limit }]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]