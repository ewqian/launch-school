When running the code you get an error with the limit variable within the method. This is due to the fact that methods have their own self contained scope. If you want to use a main variable within the method, then it must be explicetly passed in.

To fix this I would pass in the limit: `result = fib(0, 1, limit)`.
I would also need to change fib's method definition: `def fib(first_num, second_num, limit)`