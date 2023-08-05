def find_pairs(arr)
  h = {}
  arr.each do |val|
    if h.include?(val)
      h[val] += 1
    else
      h[val] = 1
    end
  end

  h = h.values.select { |num| num > 1 }
  p h.size
end

find_pairs([1, 2, 5, 6, 5, 2])