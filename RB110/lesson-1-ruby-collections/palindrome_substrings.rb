def palindrome_substrings(str)
  substr_arr = []
  chars = str.chars

  chars.each_with_index do |c, i|
    next_idx = i + 1
    
    chars[(next_idx)..(chars.length - 1)].each_with_index do |val, idx|
      adj_idx = idx + i + 1 #chars.length - (i + 1)

      if (val == c) && (chars[i..adj_idx].join == chars[i..adj_idx].join.reverse)
        substr_arr << chars[i..adj_idx].join
      end
    end

    break if i == (chars.length - 2)
  end

  substr_arr
end

p palindrome_substrings("supercalifragilisticexpialidocious")
p palindrome_substrings("abcddcbA")
p palindrome_substrings("palindrome")
p palindrome_substrings("")