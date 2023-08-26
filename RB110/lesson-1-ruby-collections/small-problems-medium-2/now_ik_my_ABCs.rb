SPELLING_BLOCKS = %w(B X D C N G R F J H V L Z).zip(%w(O K Q P A T E S W U I Y M))

def block_word?(str)
  not_available = []
  str.upcase.chars.each do |char|
    return false if not_available.include?(char)
    outer_idx = SPELLING_BLOCKS.index { |nested_arr| nested_arr.include?(char) }
    not_available << SPELLING_BLOCKS[outer_idx][0] << SPELLING_BLOCKS[outer_idx][1]
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
