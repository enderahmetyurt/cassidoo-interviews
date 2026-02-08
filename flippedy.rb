# This week's question:

# **You are given a string consisting of lowercase words, each separated by a single space. Determine how many vowels appear in the first word. Then, reverse each following word that has the same vowel count.**

# Examples:

# `flippedy("cat and mice")
# > "cat dna mice"
#
def flippedy(input)
  words = input.split(" ")
  vowels_count = words.first.scan(/[aeiou]/).count

  words.each_with_index.map { |w, i|
    if i > 0 && w.scan(/[aeiou]/).count == vowels_count
      w.reverse
    else
      w
    end
  }.join(" ")
end

p flippedy("cat and mice")
