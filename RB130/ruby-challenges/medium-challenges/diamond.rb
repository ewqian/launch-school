class Diamond
  def self.make_diamond(char)
    length = 2*(char.ord - 'A'.ord) + 1
    return "A\n" if length == 1

    diamond = ""
    diamond << "#{' ' * (length / 2)}A#{' ' * (length / 2)}\n"
    diamond << ascending_letters(char, length)
    diamond << "#{char}#{' ' * (length - 2)}#{char}\n" 
    diamond << descending_letters(char, length)
    diamond << "#{' ' * (length / 2)}A#{' ' * (length / 2)}\n"

    diamond
  end

  private

  def self.ascending_letters(char, length)
    end_char = (char.ord - 1).chr
    inner_space = 1

    ('B'..end_char).each_with_object([]) do |c, arr|
      outer_space = (length - inner_space - 2) / 2
      arr << "#{' ' * outer_space}#{c}#{' ' * inner_space}#{c}#{' ' * outer_space}\n"
      inner_space += 2
    end.join
  end

  def self.descending_letters(char, length)
    ascending_letters(char, length).lines.reverse.join
  end
end