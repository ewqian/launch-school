def print_in_box(str)
  w = str.length + 4

  def p_outer(width) # print top/bottom frame of the box
    for i in (1..width) do
      if i == 1 then print "+"
      elsif i == width then print "+\n"
      else print "-" end
    end
  end

  def p_inner(width) # print inner rows
    for i in (1..width) do
      if i == 1 then print "|"
      elsif i == width then print "|\n"
      else print " " end
    end
  end

  p_outer(w)
  p_inner(w)
  print "| " + str + " |\n" # print the center row with the text
  p_inner(w)
  p_outer(w)
end

print_in_box('')
print_in_box('To boldly go where no one has gone before.')