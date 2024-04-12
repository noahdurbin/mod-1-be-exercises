require 'csv'
require './lib/animal_lover'

class AnimalLoverFactory

  attr_reader :animal_lovers

  def initialize
    @animal_lovers = []
  end

  def create_animal_lovers(path)
    CSV.foreach((path), headers: true, header_converters: :symbol) do |row|
      @animal_lovers << AnimalLover.new(row[:id].to_i, row[:first_name], row[:last_name], row[:age].to_i)
    end
  end
end