def balanced?(str)
  open_paren_idx = []
  close_paren_idx = []

  str.each_char.with_index do |char, idx|
    open_paren_idx << idx if char == '('
    close_paren_idx << idx if char == ')'
  end

  return false if open_paren_idx.length != close_paren_idx.length
  open_paren_idx.sort!
  close_paren_idx.sort!
  open_paren_idx.each_with_index.all? { |val, idx| val < close_paren_idx[idx] }
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false