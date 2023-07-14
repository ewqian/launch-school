Q: Locate the ruby documentation for methods File::path and File#path. How are they different?
NOTE: Need to reference older ruby versions (e.g. Ruby 2.7.8)

A:
File::path
https://ruby-doc.org/2.7.8/File.html#method-c-path
This is a class method that returns the string representation of a file's path.
e.g. File.path("folder/file.txt") # => "folder/file.txt"


File#path
https://ruby-doc.org/2.7.8/File.html#method-i-path
This is an instance method that returns the path of a file object.
e.g. file = File.new("folder/file.txt")
file.path # => "folder/file.txt"