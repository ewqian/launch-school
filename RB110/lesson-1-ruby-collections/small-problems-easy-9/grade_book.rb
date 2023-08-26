def get_grade(s1, s2, s3)
  mean = (s1 + s2 + s3)/3

  case mean
  when 0...60  then 'F'
  when 60...70 then 'D'
  when 70...80 then 'C'
  when 80...90 then 'B'
  else 'A'     end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
