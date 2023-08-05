## a method that returns the sum of two integers

```
GET two integers from the user
ADD the two integers
RETURN the resulting sum
```

## a method that takes an array of strings, and returns a string that is all those strings concatenated together

```
JOIN the array of strings
RETURN the resulting string
```

## a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element.

```
SET flag = true
SET result = []

LOOP EACH value in the provided, argument array
  IF flag == true THEN push the current value to result
  FLAG = !FLAG
END

RETURN result
```

## a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

```
SET occ = 0 to keep track of occurences of a given character
SET idx = 0 to keep track of the current index of the string

LOOP each char in the argument string
  IF current_char == given_char then increment occ
  IF occ == 3 then RETURN idx
  increment idx
END

RETURN nil if 3 occurences of the given character aren't found
```

## a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes.

```
SET arr = [] to hold the merged array
SET flag = true to keep track of whether we're on an even index or not

LOOP arr1.length + arr2.length times/iterations
  push SHIFT arr1 into arr IF flag
  ELSE push SHIFT arr2 into arr
  flag = !flag
END

RETURN arr
```