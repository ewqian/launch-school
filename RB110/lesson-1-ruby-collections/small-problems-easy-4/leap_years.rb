def leap_year?(year)
  ((year % 4 == 0) && !(year % 100 == 0)) || (year % 400 == 0)
end

#p leap_year?(2015) == false
#p leap_year?(2016) == true
#p leap_year?(2100) == false
#p leap_year?(2400) == true
#p leap_year?(240000) == true
#p leap_year?(240001) == false
#p leap_year?(2000) == true
#p leap_year?(1900) == false
#p leap_year?(1752) == true
#p leap_year?(1700) == false
#p leap_year?(1) == false
#p leap_year?(100) == false
#p leap_year?(400) == true

# Further Exploration
## Rewriting the code as provided will cause the method to fail for years that are divisible by 400
## This is because we evaluate `year % 100 == 0` first and execution passes to line 3 before exiting the conditional block
## Therefore there isn't a chance to execute line 4 & 5

# Leap Years Part 2
def leap_year_pt2?(year)
  (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) || (year < 1752 && year % 4 ==0)
end

p leap_year_pt2?(2016) == true
p leap_year_pt2?(2015) == false
p leap_year_pt2?(2100) == false
p leap_year_pt2?(2400) == true
p leap_year_pt2?(240000) == true
p leap_year_pt2?(240001) == false
p leap_year_pt2?(2000) == true
p leap_year_pt2?(1900) == false
p leap_year_pt2?(1752) == true
p leap_year_pt2?(1700) == true
p leap_year_pt2?(1) == false
p leap_year_pt2?(100) == true
p leap_year_pt2?(400) == true