require "CSV"
require "./lib/animal_lover"

animal_lovers = []
CSV.foreach("./data/animal_lovers.csv", headers: true, header_converters: :symbol) do |row|
  animal_lovers << AnimalLover.new(row[:id], row[:first_name], row[:last_name], row[:age])
end
require 'pry'; binding.pry