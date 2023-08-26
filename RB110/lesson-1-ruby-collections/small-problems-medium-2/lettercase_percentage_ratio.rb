def letter_percentages(str)
  percentage_hash = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  str.chars.each do |char|
    if char.upcase == char.downcase
      percentage_hash[:neither] += 1
    elsif char == char.upcase
      percentage_hash[:uppercase] += 1
    else
      percentage_hash[:lowercase] += 1
    end
  end

  percentage_hash.transform_values { |val| (val / str.length)*100 }
end
p letter_percentages('abCdef 123')
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }