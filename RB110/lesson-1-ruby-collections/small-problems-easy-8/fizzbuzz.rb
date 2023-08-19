def fizzbuzz(lowernum, uppernum)
  (lowernum..uppernum).each do |currentnum|
    if currentnum % 3 == 0 && currentnum & 5 == 0
      print "FizzBuzz"
    elsif currentnum % 3 == 0
      print "Fizz"
    elsif currentnum % 5 == 0
      print "Buzz"
    else
      print currentnum
    end

    print ", " if currentnum != uppernum
    puts if currentnum == uppernum
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz