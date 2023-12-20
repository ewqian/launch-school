class RomanNumeral
  def initialize(int)
    @int = int
  end

  def to_roman
    int_arr = int.digits.reverse
    roman_numeral = ""

    int_arr.each_with_index do |digit, idx|
      adj_idx = IDX_TO_DEC_ROM_IDX[int_arr.length - idx]

      case digit
      when 1..3
        digit.times { roman_numeral << ROMAN_NUMERALS[adj_idx] }
      when 4
        roman_numeral << ROMAN_NUMERALS[adj_idx]
        roman_numeral << ROMAN_NUMERALS[adj_idx + 1]
      when 5
        roman_numeral << ROMAN_NUMERALS[adj_idx + 1]
      when 6..8
        roman_numeral << ROMAN_NUMERALS[adj_idx + 1]
        (digit - 5).times { roman_numeral << ROMAN_NUMERALS[adj_idx] }
      when 9
        roman_numeral << ROMAN_NUMERALS[adj_idx]
        roman_numeral << ROMAN_NUMERALS[adj_idx + 2]
      end
    end

    roman_numeral
  end

  private

  DECIMALS = [1, 5, 10, 50, 100, 500, 1000]
  ROMAN_NUMERALS = %w(I V X L C D M)
  IDX_TO_DEC_ROM_IDX = [1, 2, 3, 4].zip([0, 2, 4, 6]).to_h

  attr_reader :int
end