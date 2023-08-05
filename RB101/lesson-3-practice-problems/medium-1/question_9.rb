bar(foo) # this returns "no"

# foo is called first and returns "yes" (parameter variable param isn't used)
# "yes" is used as an argument in bar which causes the ternary operator to evaluate to false...
# which corresponds to a return value of "no"