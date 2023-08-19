def time_of_day(int)
  hours, minutes = int.divmod(60)
  hh = (hours % 24) >= 10 ? (hours % 24).to_s : (hours % 24).to_s.prepend('0')
  mm = minutes >= 10 ? minutes.to_s : minutes.to_s.prepend('0')
  "#{hh}:#{mm}"
end

#p time_of_day(0) == "00:00"
#p time_of_day(-3) == "23:57"
#p time_of_day(35) == "00:35"
#p time_of_day(-1437) == "00:03"
#p time_of_day(3000) == "02:00"
#p time_of_day(800) == "13:20"
#p time_of_day(-4231) == "01:29"

def after_midnight(str)
  hours, minutes = str.split(':')
  hours = 0 if hours.to_i == 24
  60*hours.to_i + minutes.to_i
end

def before_midnight(str)
  hours, minutes = str.split(':')
  return 0 if (hours.to_i == 24 || hours.to_i == 0) && minutes.to_i == 0
  1440 - (60*hours.to_i + minutes.to_i)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
