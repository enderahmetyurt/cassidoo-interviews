# Find the majority element in an array (one that appears more than n/2 times) in O(n) time and O(1) space without hashmaps.
# Hint: the Boyer-Moore Voting algorithm might help if you can’t figure this one out!

# Example

# > majorityElement([2, 2, 1, 1, 2, 2, 1, 2, 2])
# 2

# > majorityElement([3, 3, 4, 2, 3, 3, 1])
# 3

def majority_element(array)
  candidate, count = array[0], 0

  array.each do |element|
    count == 0 ? candidate = element : nil
    count += element == candidate ? 1 : -1
  end

  candidate
end

p majority_element([2, 2, 1, 1, 2, 2, 1, 2, 2])
p majority_element([3, 3, 4, 2, 3, 3, 1])
