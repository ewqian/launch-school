class Robot
  @@used_names = []
  CHAR = ('A'..'Z').to_a
  NUM = ('0'..'9').to_a

  attr_reader :name

  def initialize
    @name = unique_name()
    @@used_names << name
  end

  def reset
    initialize
  end

  private

  def unique_name
    loop do
      uniq_name = ""
      2.times { uniq_name << CHAR.sample }
      3.times { uniq_name << NUM.sample }
      return uniq_name unless @@used_names.include?(uniq_name)
    end
  end
end