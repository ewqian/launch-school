# PROBLEM:
Given a string, write a method `palindrome_substrings` which returns
all the substrings from a given string which are palindromes. Consider
palindrome words case sensitive.

# Test cases:
palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []

# P - (Understand the) Problem
Questions:
- Is this method case sensitive? e.g. is 'Dad' a palindrome?
- If there are palindromes nested within eachother should all of them get returned or just the outer-most encompassing palindrome?
- What if we're passed an empty string or a string without palindromes?
- Should we assume that we're given a valid string? e.g. no special characters, numbers etc.
- In what format should the substrings be returned if there are multiple palindromes?

Requirements:
- Return all substrings that are palindromes (even nested ones) in a new array
- Palindrome words are case sensitive
- Empty strings or strings passed without palindromes should return an empty array

Algorithm:
- Data Strcuture: Initialize an empty array at the start to hold the palindrome substrings.
- Identify palindromes:
  - Break the string down into an array of characters
  - Loop each character in the array
    - Find subsequent characters that match the current and create substrings using & including the characters bounded by the matching characters
    - Test each substring to see if it's a palindrome, if it is push it into the results array
- Return the results array