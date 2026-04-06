def perrin_numbers(n)
  return [3][0..n] if n <= 0
  return [3, 0][0..n] if n == 1
  return [3, 0, 2][0..n] if n == 2

  perrin = [3, 0, 2]
  (3..n).each { |i| perrin << perrin[i-2] + perrin[i-3] }

  perrin
end

def perrin_combinations(n, k)
  numbers = perrin_numbers(n).uniq.sort
  result = []

  find_combinations(numbers, k, 0, [], result)

  result.sort_by { |combo| [combo.length, combo] }
end

def find_combinations(numbers, remaining, start, current, result)
  result << current.dup if remaining == 0

  numbers.each_with_index do |num, i|
    next if i < start
    break if num > remaining

    current << num
    find_combinations(numbers, remaining - num, i + 1, current, result)
    current.pop
  end
end
