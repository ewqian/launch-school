class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further Exploration

# I think creating and initializing Book objects in two separate steps is a unneccessarily tedious.
# It'd be better to create and initialize at the same time like in the previous exercise.
# If you do seperate steps you risk the user forgetting to set values for author &/or title.