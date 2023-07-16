def triangle(int, reverse=false)
  spaces = reverse ? 0 : int - 1

  for i in (1..int) do
    print "#{' ' * spaces}"
    puts "#{'*' * (int - spaces)}"
    if reverse then spaces += 1
    else spaces -= 1 end
  end
end

def pick_triangle(int, corner='BR') # corner options: 'BR', 'TR', 'TL', 'BL'
  spaces = corner.include?('T') ? 0 : int - 1

  for i in (1..int) do
    if corner.include?('R')
      print "#{' ' * spaces}"
      puts "#{'*' * (int - spaces)}"
    else
      print "#{'*' * (int - spaces)}"
      puts "#{' ' * spaces}"
    end

    if corner.include?('T') then spaces += 1
    else spaces -= 1 end
  end
end

pick_triangle(5,'TR')