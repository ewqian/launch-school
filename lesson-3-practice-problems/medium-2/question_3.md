string_arg_one will print "pumpkins"
string_arg_two will print "pumpkinsrutabaga"

Strings are mutable. However whether or not tricky_method mutates them depends on the oeprators. invoked on them. In this case the `+=` operator doesn't mutate the caller while the `<<` operator does.