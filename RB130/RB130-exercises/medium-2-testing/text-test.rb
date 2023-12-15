require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "text"

class TextTest < Minitest::Test
  def setup
    @file = File.new("text.rb", "r")
    @file_str = @file.read
    @txt = Text.new(@file_str)
  end

  def test_swap
    exp_e_count = @file_str.count('ae')
    swapped_txt = @txt.swap('a', 'e')
    assert_equal exp_e_count, swapped_txt.count('e')
  end

  def test_word_count
    exp_count = @file_str.split.count
    assert_equal exp_count, @txt.word_count
  end

  def teardown
    @file.close
  end
end