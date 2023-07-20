def palindromic_number?(num)
  p num
  num.to_s(10) == num.to_s(10).reverse
end

#p palindromic_number?(34543) == true
#p palindromic_number?(123210) == false
#p palindromic_number?(22) == true
#p palindromic_number?(5) == true

p palindromic_number?(0011)