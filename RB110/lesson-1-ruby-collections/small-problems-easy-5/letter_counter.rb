def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, count_hash|
      count_hash[word.length] += 1
  end
end

#p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
#p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
#p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
#p word_sizes('') == {}

def word_sizes_only(str)
  str.split.each_with_object(Hash.new(0)) do |word, count_hash|  
    count_hash[(word.gsub(/\W/, '')).length] += 1
  end
end

p word_sizes_only('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes_only('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes_only("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes_only('') == {}