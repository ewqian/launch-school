def triangle(a1, a2, a3)
  return :invalid if a1 + a2 + a3 != 180 || a1 <= 0 || a2 <= 0 || a3 <= 0
  angle_arr = [a1, a2, a3]
  largest_angle = angle_arr.max
  largest_angle < 90 ? :acute : ( largest_angle == 90 ? :right : :obtuse )
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid