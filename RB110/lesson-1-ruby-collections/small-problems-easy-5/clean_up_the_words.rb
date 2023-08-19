def cleanup(str)
  str.gsub!(/\W+/, ' ').gsub!(/[^\p{Alpha}]/, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '