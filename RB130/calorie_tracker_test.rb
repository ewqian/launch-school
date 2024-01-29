require 'minitest/autorun'
require_relative 'calorie_tracker'

class CalorieTrackerTest < Minitest::Test

  # other test(s) omitted for brevity

  def test_add
    tracker = CalorieTracker.new
    tracker.add(500)
    assert_equal(500, tracker.current)
    tracker.add(300)
    assert_equal(800, tracker.current)
    tracker.add(200)
    assert_equal(1000, tracker.current)
  end

  def test_add_error
    tracker = CalorieTracker.new
    assert_raises(TypeError) { tracker.add("hello") }
  end
end