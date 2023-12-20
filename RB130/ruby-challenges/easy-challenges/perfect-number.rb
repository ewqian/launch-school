class PerfectNumber
  def self.classify(num)
    raise StandardError if num <= 0
    divisors = []
    limit = Math.sqrt(num).to_i

    (1..limit).each { |n| divisors << n if num % n == 0 }
    divisors.clone[1..-1].each { |div| divisors << (num / div) }

    aliquot_sum = divisors.inject(:+)
    if aliquot_sum == num then 'perfect'
    elsif aliquot_sum > num then 'abundant'
    else 'deficient' end
  end
end