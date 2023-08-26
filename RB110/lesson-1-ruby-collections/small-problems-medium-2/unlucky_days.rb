require 'date'

def friday_13th(year)
  start_date = Date.new(year)
  end_date = Date.new(year, 12 ,31)

  (start_date..end_date).count { |current_date| current_date.day == 13 && current_date.friday? }
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2