def reduce(arr, accum=:default)
  if accum == :default
    accum = arr[0]
    start_idx = 1
  else
    start_idx = 0
  end

  end_idx = arr.length - 1

  (start_idx..end_idx).each do |idx|
    accum = yield(accum, arr[idx])
  end

  accum
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']