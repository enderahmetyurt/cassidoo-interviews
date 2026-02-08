# Given an array of objects representing bears in a forest, each with a name and hunger level,
# return the names of all bears whose hunger level is above the forest average,
# sorted alphabetically. In how few lines can you do this one?

def hungry_bears(bears)
  average = bears.sum { |bear| bear[:hunger] } / bears.size.to_f
  bears.select { |bear| bear[:hunger] > average }
       .map { |bear| bear[:name] }
       .sort
end

bears = [
  { name: 'Baloo', hunger: 6 },
  { name: 'Yogi', hunger: 9 },
  { name: 'Paddington', hunger: 4 },
  { name: 'Winnie', hunger: 10 },
  { name: 'Chicago', hunger: 20 },
]

puts hungry_bears(bears)
