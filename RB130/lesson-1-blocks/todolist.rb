# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.instance_of?(Todo)
      self.todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(idx)
    get_or_manipulate_list_items(idx, :item_at)
  end

  def mark_done_at(idx)
    get_or_manipulate_list_items(idx, :mark_done_at)
  end

  def mark_undone_at(idx)
    get_or_manipulate_list_items(idx, :mark_undone_at)
  end

  def done!
    todos.each do |todo|
      todo.done!
    end

    todos
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    get_or_manipulate_list_items(idx, :remove_at)
  end

  def to_s
    ret_arr = []
    ret_arr << "---- Today's Todos ----"
    ret_arr << todos
    ret_arr.join("\n")
  end

  def each
    todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    new_list = TodoList.new(title)
    new_list.todos = todos.select { |todo| yield(todo) }
    new_list
  end

  def find_by_title(str)
    todos.each do |todo|
      return todo if todo.title == str
    end

    nil
  end

  def all_done
    self.select do |todo|
      todo.done?
    end
  end

  def all_not_done
    self.select do |todo|
      !(todo.done?)
    end
  end

  def mark_done(str)
    todos.each do |todo|
      todo.done! if todo.title == str
    end
  end

  def mark_all_done
    todos.each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    todos.each do |todo|
      todo.undone!
    end
  end

  protected

  attr_accessor :todos

  private

  def get_or_manipulate_list_items(idx, action)
    if (0..(todos.size - 1)) === idx
      case action
      when :item_at
        todos[idx]
      when :mark_done_at
        todos[idx].done!
      when :mark_undone_at
        todos[idx].undone!
      when :remove_at
        todos.delete_at(idx)
      end
    else
      raise IndexError
    end
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)


p list.find_by_title("Buy milk")
p list.all_done
p list.all_not_done
p list.mark_done("Clean room")
p list.mark_all_done
p list.mark_all_undone

puts list