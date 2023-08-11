def select_fruit(produce)
  fruits = {}
  
  produce.each do |k, v|
    fruits[k] = v if v == 'Fruit'
  end

  fruits
end

def double_numbers!(nums)
  nums.each_with_index do |num, i|
    nums[i] = num * 2
  end
end

def double_odd_indice_numbers(nums)
  nums.each_with_index do |num, i|
    nums[i] = num * 2 if i.odd?
  end
end

def multiply(nums, factor)
  nums.each_with_index do |num, i|
    nums[i] = num * factor
  end
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
# p my_numbers

# p double_odd_indice_numbers(my_numbers)

p multiply(my_numbers, 3)