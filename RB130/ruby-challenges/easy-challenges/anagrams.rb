class Anagram
  def initialize(subject)
    @subject = subject
  end

  def match(arr)
    arr.each_with_object([]) do |word, anagram_arr|
      anagram_arr << word if anagram?(word)
    end
  end

  private

  def anagram?(word)
    word.downcase.chars.sort == subject.downcase.chars.sort &&
    word.downcase.chars != subject.downcase.chars
  end

  attr_reader :subject
end