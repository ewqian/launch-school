class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further Exploration
# attr_reader sets up a getter function, attr_writer sets up a setter function & attr_accessor
# sets up both getter & setter functions

# attr_reader is used because in line 10 we only needed to retrieve the values for title & author
# it wouldn't be okay to use attr_writer since we aren't setting anything, however attr_accessor
# would've as long as we're okay with a setter function being defined (in this context probably
# not since we'd never want to change the author & title of a book)

# adding these two methods wouldn't change the behavior of the class since they do the same thing
# as attr_reader. the advantage of this code is the potential to customize the formatting for the
# getter functions if you wnated to.