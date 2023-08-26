require 'pry'

def bubble_sort!(arr)
  swapped = true

  while swapped
    swapped = false
    (1..(arr.length - 1)).each do |idx|
      if arr[idx-1] > arr[idx]
        arr[idx], arr[idx-1] = arr[idx-1], arr[idx] if arr[idx-1] > arr[idx]
        swapped = true
      end
    end
  end

  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
