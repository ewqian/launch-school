As naming conventions the bang (!) operator can act as a suffix to a method name to indicate that the method mutates the caller / arguments. The question mark (?) operator as a suffix is used to indicate that a method returns a boolean value, typically used to perform some inquiry / test.

1. The `!=` operator is a comparison operator that tests to see if two values aren't equal to each other. It'll return true if they aren't equal and false otherwise. You should use this in conditional statements where you want to verify if values aren't equal to eachother.
2. Putting `!` before something like `!user_name` allows you to use it as a logical negation operator. It'll take the truthy / falsy object it's prefixing and return a boolean that's a negation of it.
3. Putting `!` as a suffix is commonly used as a naming convention to indicate that a method is destructive (aka can mutate its caller / arguments).
4. Putting a `?` before a single character will give you its ASCII value (character encoding standard).
5. Putting `?` after something is a naming convention to indicate that a method is performing an inquiry / test and will return a boolean.
6. Using `!!` to prefix an object will give you the boolean equivalent of the truthy / falsy object that follows it.