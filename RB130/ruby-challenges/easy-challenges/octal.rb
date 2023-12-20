class Octal
  def initialize(str)
    @octal = valid_int(str)
  end

  def to_decimal
    digits = octal.digits
    octal_digits = []

    digits.each_with_index do |digit, idx|
      octal_digits << digit*8**(idx)
    end

    octal_digits.sum
  end

  private

  attr_reader :octal

  def valid_int(str)
    valid = /\A\d+\z/.match?(str) && str.to_i.digits.all? { |digit| digit <= 7  }
    valid ? str.to_i : 0
  end
end