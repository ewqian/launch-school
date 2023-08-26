def thousand_lights(n)
  arr = (1..n).zip(Array.new(n, true))

  (2..n).each do |idx|
    (idx..n).step(idx).each { |i| arr[i-1][1] = !(arr[i-1][1]) }
  end
  
  arr.map { |switch, light_on| switch if light_on }.select { |val| val != nil }
end

p thousand_lights(5)
p thousand_lights(10)