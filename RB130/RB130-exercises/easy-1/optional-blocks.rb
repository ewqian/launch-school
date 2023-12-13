def compute
  return yield if block_given?
  'Does not compute.'
end

def compute_fe(arg)
  block_given? ? yield(arg) : 'Does not compute'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'
p compute_fe(5) { |int| int * 3 } == 15