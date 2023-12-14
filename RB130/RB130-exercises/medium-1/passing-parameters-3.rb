items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*fruit_and_veg, grain|
  puts fruit_and_veg.join(", ")
  puts grain
end

# 2
gather(items) do |fruit, *veg, grain|
  puts fruit
  puts veg.join(", ")
  puts grain
end

# 3
gather(items) do |fruit, *others|
  puts fruit
  puts others.join(", ")
end

# 4
gather(items) do |a, co, ca, w|
  puts "#{a}, #{co}, #{ca}, and #{w}"
end