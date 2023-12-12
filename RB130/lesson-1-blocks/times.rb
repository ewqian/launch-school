def times(int)
  (0..(int - 1)).each { |num| yield(num) }
  int
end

times(5) do |num|
  puts num
end