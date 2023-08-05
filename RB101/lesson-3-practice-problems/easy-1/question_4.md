The delete method will remove 0+ elements from the calling array that match the passed in argument. This method will return the last deleted element (if called without a block).

The delete_at method deletes an element from an array at the given integer index as specified by the provided arugment. This method will return the deleted element.

Both methods are destructive and can mutate their calling arrays.

`numbers.delete_at(1)`
Returns: 2
Output of `p numbers`: [1, 3, 4, 5]

`numbers.delete(1)`
Returns: 1
Output of `p numbers`: [2, 3, 4, 5]
