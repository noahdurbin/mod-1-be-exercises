# Part Two
# Given the following array:
nested_animals = [[:dog, :cat, :zebra], [:quokka, :unicorn, :bear]]

# Use an enumerable to:
# 1. Return an unnested (single layer) array of animals as strings
flattened_animals = nested_animals.flatten.map do |animal|
    animal.to_s
end

print flattened_animals


# 2. Return an unnested array of animals with length >= 4

over_four = flattened_animals.find_all do |name|
    name.length >= 4
end

print over_four

# 3. Return a hash where the keys are the animal, and the values are the length. ex: {dog: 3, cat: 3, zebra: 5 ... }

