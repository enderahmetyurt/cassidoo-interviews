# Given an integer array and a number n, move all of the ns to the end of the array while maintaining the relative order of the non-ns. Bonus: do this without making a copy of the array!

# Example:

# $ moveNums([0,2,0,3,10], 0)
# $ [2,3,10,0,0]

def move_nums(array, number)
  return unless array.include? number

  write = 0

  array.each do |element|
    if element != number
      array[write] = element
      write += 1
    end
  end

  (write...array.length).each { |i| array[i] = number }

  array
end

pp move_nums([0,2,0,3,10], 0)
