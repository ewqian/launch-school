def group_anagrams(words_arr)
  char_hash_arr = words_arr.map do |word|
    empty_hash = Hash.new(0)
    [word, word.chars.each_with_object(empty_hash) { |char, hash| hash[char] += 1 }]
  end

  char_hash_arr = char_hash_arr.group_by { |word, hash| hash }.values
  char_hash_arr.map { |arr| arr.map { |subarr| subarr[0] } }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

p group_anagrams(words)
