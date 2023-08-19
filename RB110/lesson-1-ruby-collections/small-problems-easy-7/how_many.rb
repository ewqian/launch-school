def count_occurrences(vehicles)
  ret_hash = vehicles.uniq.zip(Array.new(vehicles.length, 0)).to_h
  vehicles.each_with_object(ret_hash) { |vehicle, hash| hash[vehicle] += 1 }
  ret_hash.each { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)