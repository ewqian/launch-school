require 'pry'

def swap(str)
  words_arr = str.split.each do |word|
    tracker = word.reverse
    word[0] = tracker[0]
    word[-1] = tracker[-1]
  end

  words_arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'