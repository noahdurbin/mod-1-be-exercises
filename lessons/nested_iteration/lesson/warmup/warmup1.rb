# Part One
# Given the follow array:
animals = [:dog, :cat, :zebra, :quokka, :unicorn, :bear]

# Use an enumerable to
# 1. Return an array of animals as strings.

animal_names = animals.map do |animal| 
    animal.to_s
end

print animal_names


# 2. Return an array of animals with a length >= 4.

over_four = animal_names.find_all do |name|
    name.length >= 4
end

print over_four