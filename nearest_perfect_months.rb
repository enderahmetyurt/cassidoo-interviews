# This week's question:
# February 2026 is a perfect month! Write a function that returns the closest previous and next perfect month around the given Gregorian year.

# Examples:

# nearestPerfectMonths(2025)
# > { prev: "2021-02", next: "2026-02" }

require 'date'

def find_nearest_perfect_months(year)
  prev_year = year - 1
  prev_year -= 1 until perfect_february?(prev_year)

  next_year = year + 1
  next_year += 1 until perfect_february?(next_year)

  { prev: "#{prev_year}-02", next: "#{next_year}-02" }
end

def perfect_february?(y)
  !Date.leap?(y) && [0, 1].include?(Date.new(y, 2, 1).wday)
end

p find_nearest_perfect_months(2025)
