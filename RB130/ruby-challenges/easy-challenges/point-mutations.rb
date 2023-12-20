class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    strand1 = (strand.length <= other_strand.length ? strand : other_strand).chars
    strand2 = (strand == strand1.join ? other_strand : strand).chars
    hamming_distance = 0

    strand1.each_index { |idx| hamming_distance += 1 if strand1[idx] != strand2[idx] }
    hamming_distance
  end

  private

  attr_reader :strand
end