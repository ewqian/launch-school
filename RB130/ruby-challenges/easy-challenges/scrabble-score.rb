class Scrabble
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    w = word.strip.upcase
    return 0 if w == ''

    w.chars.uniq.map do |char|
      letter_to_val(char) * w.count(char)
    end.inject(:+)
  end

  def self.score(str)
    word = Scrabble.new(str)
    word.score
  end

  private

  attr_reader :word

  def letter_to_val(c)
    if    %w(A E I O U L N R S T).include?(c) then 1
    elsif %w(D G).include?(c)                 then 2
    elsif %w(B C M P).include?(c)             then 3
    elsif %w(F H V W Y).include?(c)           then 4
    elsif %w(K).include?(c)                   then 5
    elsif %w(J X).include?(c)                 then 8
    elsif %w(Q Z).include?(c)                 then 10
    end
  end
end