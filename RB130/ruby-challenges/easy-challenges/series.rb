class Series
  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > digits.length

    (0..(digits.length - 1)).each_with_object([]) do |idx, series_arr|
      return series_arr if idx + n > digits.length
      series_arr << digits[idx..(idx + n - 1)]
    end
  end

  private

  attr_reader :digits
end