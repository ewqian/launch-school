require 'pry'

def egyptian(rational_num)
  rational_arr = []
  current_num = rational_num
  largest_uf_denom = nil

  loop do
    largest_uf_denom = (current_num.denominator.to_f / current_num.numerator).ceil
    loop do
      break if !(rational_arr.map(&:denominator).include?(largest_uf_denom))
      largest_uf_denom += 1
    end

    current_num -= Rational(1, largest_uf_denom)
    rational_arr << Rational(1, largest_uf_denom)
    break if rational_arr.sum == rational_num
  end

  rational_arr.map(&:denominator)
end

def unegyptian(egypt_arr)
  egypt_arr.map { |val| Rational(1, val) }.sum
end

p egyptian(Rational(521, 1050))   # -> [3, 7, 50]
p egyptian(Rational(2, 1))        # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60))     # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))        # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)