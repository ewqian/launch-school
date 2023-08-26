def triangle(s1, s2, s3)
  return :invalid if s1 <= 0 || s2 <= 0 || s3 <= 0
  triangle_arr = [s1, s2, s3].sort!
  largest_side = triangle_arr.pop
  return :invalid if triangle_arr.inject(&:+) <= largest_side

  return :equilateral if s1 == s2 && s2 == s3
  return :scalene if s1 != s2 && s2 != s3 && s1 != s3
  :isosceles
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid