name = 'Bob' # name points to an address in memory that contains 'Bob'
save_name = name # save_name points to the same location as name
name.upcase! # upcase! is a destructive method that mutates the caller from 'Bob' to 'BOB'
puts name, save_name # this prints name & save_name (which both point to the same address in memory)

# this block of code prints...
# BOB
# BOB