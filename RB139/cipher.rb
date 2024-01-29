class Cipher
  A_TO_M = ('a'..'m').zip(('n'..'z').to_a.reverse).to_h
  N_TO_Z = ('n'..'z').zip(('a'..'m').to_a.reverse).to_h

  def self.encode(str)
    str = str.downcase.gsub(' ', '').gsub(/[[:punct:]]/, '')
    encoded = ''

    str.chars.each_with_index do |char, idx|
      encoded << ' ' if idx % 5 == 0 && !idx.zero?
      encoded << encode_char(char)
    end

    encoded
  end

  class << self
    private

    def encode_char(char)
      if A_TO_M.keys.include?(char)
        A_TO_M[char]
      elsif N_TO_Z.keys.include?(char)
        N_TO_Z[char]
      else # if char is a number
        char
      end
    end
  end
end
