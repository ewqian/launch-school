require 'pry'
DEGREE = "\xC2\xB0"

def dms(num)
  degree, deg_decimal = num.to_f.to_s.split('.')
  minutes, seconds = (deg_decimal.to_f * 60 * (10**-(deg_decimal.length))).round(4).to_s.split('.')
  seconds = (seconds.to_i * 60 * 10**-(seconds.length)).round(0).to_s
  %(#{degree}#{DEGREE}#{format('%.2d', minutes)}'#{format('%.2d', seconds)}")
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")