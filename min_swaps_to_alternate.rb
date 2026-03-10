# Given a string s consisting only of 'a' and 'b', you may swap adjacent characters any number of times. Return the minimum number of adjacent swaps needed to transform s into an alternating string, either "ababab..." or "bababa...", or return -1 if it's impossible.

# Example:

# minSwapsToAlternate('aabb')
# 1

# minSwapsToAlternate('aaab')
# -1

# minSwapsToAlternate('aaaabbbb')
# 6

def min_swaps_to_alternate(s)
  n = s.length
  a = s.chars.each_with_index.filter_map { |c, i| i if c == 'a' }
  b_count = n - a.length

  swaps = ->(a_starts) {
    expected = a_starts ? (n + 1) / 2 : n / 2
    a.each_with_index.sum { |p, i| (p - (a_starts ? 2 * i : 2 * i + 1)).abs } if a.length == expected
  }

  if n.even?
    a.length == b_count ? [swaps.(true), swaps.(false)].min : -1
  elsif a.length == (n + 1) / 2 then swaps.(true)
  elsif b_count  == (n + 1) / 2 then swaps.(false)
  else -1
  end
end

p min_swaps_to_alternate('aabb')     # => 1
p min_swaps_to_alternate('aaab')     # => -1
p min_swaps_to_alternate('aaaabbbb') # => 6
