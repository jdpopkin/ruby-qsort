# Assumes we are partitioning on the first element of arr
# Using linear space as per Hackerrank's instructions
def partition(arr, left, right)
  pivot = arr.first

  arr.each_with_index do |num, i|
    next if i == 0
    if num < pivot
      left.push(num)
    else
      right.push(num)
    end
  end
end

def qsort(arr)
  return arr if arr.length <= 1
  pivot = arr.first

  left, right = [], []

  partition(arr, left, right)

  left = qsort(left)
  right = qsort(right)

  left << pivot

  arr = left + right
  puts arr.join(" ")

  arr
end

n = gets.to_i
nums = gets.split.map(&:to_i)
new_arr = qsort(nums)