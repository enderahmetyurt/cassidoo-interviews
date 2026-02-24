# Given an array of integers, find the contiguous subarray that has the largest sum and return that sum. A subarray must contain at least one element. If all elements are negative, return the largest (least negative) value. If you need a hint, look up Kadane's Algorithm!

# Examples:

# > maxSubarraySum([-2, 1, -3, 4, -1, 2, 1, -5, 4])
# 6
# > maxSubarraySum([5])
# 5
# > maxSubarraySum([-1, -2, -3, -4])
# -1
# > maxSubarraySum([5, 4, -1, 7, 8])
# 23


def max_subarray_sum(array)
  max_sum = array.first
  current_sum = array.first

  array[1..].each do |num|
    current_sum = [num, current_sum + num].max
    max_sum = [max_sum, current_sum].max
  end

  max_sum
end

pp max_subarray_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4])
