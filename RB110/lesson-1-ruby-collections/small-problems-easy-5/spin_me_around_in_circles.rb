# The returned string will be a different object as the one passed in as an argument
# This is because calling the `split` method creates a new array objects with the substrings of `str`
# So even though the destructive method `reverse!` is called, it's applied to the new string objects in the array rather than `str`
