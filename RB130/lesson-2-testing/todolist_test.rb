require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../lesson-1-blocks/todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first)
  end

  def test_last
    assert_equal(@todos.last, @list.last)
  end

  def test_shift
    assert_equal(@todos.shift, @list.shift)
    @todos.each_index do |idx|
      assert_equal(@todos[idx], @list[idx])
    end
  end

  def test_pop
    assert_equal(@todos.pop, @list.pop)
    assert_equal(@todos, @list.to_a)
  end

  def test_done?
    assert_equal(@todos.all?(&:done?), @list.done?)
  end

  def test_adding_type_error
    begin
      @list.add(5)
    rescue => e
      assert_instance_of(TypeError, e)
    end
    # could just use #assert_raises here
  end

  def test_shovel_method
    todo4 = Todo.new('Meal prep')
    @list << todo4
    assert_equal(todo4, @list.last)
  end

  def test_add_method
    todo4 = Todo.new('Meal prep')
    @list.add(todo4)
    assert_equal(todo4, @list.last)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100)}

    @list.mark_done_at(1)
    assert_equal(@todo2.done?, @list[1].done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100)}

    (0..(@list.size - 1)).each do |idx|
      @list.mark_done_at(idx)
    end

    @list.mark_undone_at(1)
    assert_equal(false, @list[1].done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_nil(@list.find_by_title(@todo2.title))
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_todo_done
    @list.mark_done_at(1)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [#{Todo::DONE_MARKER}] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_todos_done
    @list.mark_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [#{Todo::DONE_MARKER}] Buy milk
    [#{Todo::DONE_MARKER}] Clean room
    [#{Todo::DONE_MARKER}] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    i = 0
    @list.each do |todo|
      assert_equal(@todos[i], todo)
      i += 1
    end
  end

  def test_each_return_value
    ret_val = @list.each { }
    assert_same(@list, ret_val)
  end

  def test_select
    @list.mark_done_at(1)
    select_list = @list.select { |todo| todo.done? }
    assert_equal(true, select_list.done?)
    assert_equal([@todo2], select_list.to_a)
  end
end