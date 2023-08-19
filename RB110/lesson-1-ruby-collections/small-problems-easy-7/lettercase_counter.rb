def letter_case_count(str)
  ret_hash = {}
  ret_hash[:lowercase] = str.chars.count { |char| char.match?(/[a-z]/) }
  ret_hash[:uppercase] = str.chars.count { |char| char.match?(/[A-Z]/) }
  ret_hash[:neither] = str.chars.count { |char| char.match?(/[^A-Za-z]/) }
  ret_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }