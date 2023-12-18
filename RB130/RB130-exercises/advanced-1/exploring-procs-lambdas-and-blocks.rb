# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 1 Observations
# clearly this example shows how procs have leniant arity
# in line 5 we call my_proc w/ no arguments even though it takes one - 'thing'
# this didn't yield an error & 'thing' defaulted to nil...
  # which interpolated in a string becomes an empty string

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
#my_lambda.call
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 2 Observations
# based on the lambda definitions & line 19 we can see that lambdas are a type of proc
# they have strict arity since line 21 causes an error
# lines 15, 16 shows us that there are multiple ways to define them
# line 22 shows us that lambdas aren't their own class and we can't instantiate objects from them

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
#block_method_1('seal')

# block methods can't be explicetly called like procs can
# they can only yield to the block argument
# line 36 yields a LocalJumpError if we don't provide a block

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}