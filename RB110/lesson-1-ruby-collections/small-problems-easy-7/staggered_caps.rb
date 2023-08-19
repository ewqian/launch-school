def staggered_case(str)
  idx = 0
  str.chars.map do |char|
    if idx.even?
      idx += 1
      char.upcase
    else
      idx += 1
      char.downcase
    end
  end.join
end

#p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
#p staggered_case('ALL_CAPS') == 'AlL_CaPs'
#p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case_pt2(str)
  idx = 0
  str.chars.map do |char|
    if char.upcase == char.downcase
      char
    elsif idx.even?
      idx += 1
      char.upcase
    else
      idx += 1
      char.downcase
    end
  end.join
end

#p staggered_case_pt2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
#p staggered_case_pt2('ALL CAPS') == 'AlL cApS'
#p staggered_case_pt2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

def staggered_case_fe(str, toggle_nonalpha = true)
  upper = true
  str.chars.each_with_object("") do |char, ret_str|
    next ret_str << char if !toggle_nonalpha && !(char =~ /[a-z]/i)
    ret_str << (upper ? char.upcase : char.downcase)
    upper = !upper
  end
end

p staggered_case_fe('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case_fe('ALL_CAPS') == 'AlL_CaPs'
p staggered_case_fe('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case_fe('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case_fe('ALL CAPS', false) == 'AlL cApS'
p staggered_case_fe('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'