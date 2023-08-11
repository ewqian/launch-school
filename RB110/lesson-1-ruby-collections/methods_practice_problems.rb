# Practice Problem 1

# The return value is: [1, 2, 3]
# Because the last line evaluated in the block is 'hi'
# This is truthy and the current `num` is selected & included within the new array that is returned


# Practice Problem 2

# It evaluates the truthiness of the block's return value
# If the block returns a truthy value it'll add one to the tally
# When the `count` method returns it'll return an integer, the tally
# We can have the block return different values and see how that impacts `count`'s return value


# Practice Problem 3

# `reject` returns an array of the values in which the block evaluated as false
# In this case, during every iteration the block returns a falsy value
# Because the `puts` method returns nil which is falsy
# This means that the new array that is returned will be: [1, 2, 3]


# Practice Problem 4

# The `each_with_object` method returns the object initially provided as an argument (in this case a hash)
# The return of this method in the code is: { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat }


# Practice Problem 5

# The `shift` method removes the first key-value pair and returns it as a 2 element array
# The shift method will mutate its caller
# To find out just check ruby documentation
# In this code `hash.shift` returns: [:a, 'ant']


# Practice Problem 6

# The return value is: 11
# The `pop` method remove and returns 'caterpillar'
# The chained `size` method calculates the size of `caterpillar` which is 11


# Practice Problem 7

# The `any?` method evaluates the truthiness of the block
# If any of the iterations yield a truthy value than this method will return true
# This code returns: True


# Practice Problem 8

# The `take` method grabs the first n (argument number) values of an array & returns a new array containing those values
# It's NOT destructive
# Find out via ruby documentation


# Practice Problem 9

# The `map` method when called by a hash originates from the Enumerable class
# This method returns an array whose values are those that have been returned by the block
# This code returns: [nil, 'bear']


# Practice Problem 10

# This code returns: [1, nil, nil]