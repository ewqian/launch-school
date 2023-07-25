def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# there is a difference between these two methods
# the '<<' operator mutates the provided array argument
  # this allows the method to properly shift values out of the array so that the max buffer size isn't exceeded
# the '+' operator also concats two arrays but doesn't mutate the provided array argument
  # this means that the buffer size won't exceed the max since the main array won't ever change via the method