include Math

def divisors(int)
  # exhaustive trial divison of all integers from 1 up to sqrt(int)
  divisors = []
  check_arr = (1..sqrt(int)).to_a
  check_arr.each { |num| divisors << num if int % num == 0 }
  # generate pairs to identify remaining divisors & append them to the return array
  divisors.clone.each { |num| divisors << (int / num) }
  divisors.uniq.sort
end

p divisors(1) == [1]
p divisors(7)  == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute