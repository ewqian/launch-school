DIGITS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'].zip((0..9)).to_h
PUNCTUATION = %w(. , ! ?)

def word_to_digit(str)
  str.split.each_with_object([]) do |word, arr|
    if PUNCTUATION.include?(word[-1])
      punc = word[-1]
      word = word[0..-2]
    end

    arr << (DIGITS.keys.include?(word) ? DIGITS[word].to_s : word)
    arr.last << punc if punc != nil
  end.join(' ')
end

# could've used gsub! here
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'