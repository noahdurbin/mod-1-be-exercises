class MagicalPet

  attr_reader :id, :name, :pet_owner_id

  def initialize(id,name,pet_owner_id)
    @id = id
    @name = name
    @pet_owner_id = pet_owner_id
  end

  def self.create_magical_pets(path)
    magical_pets = []
    CSV.foreach((path), headers: true, header_converters: :symbol) do |row|
      magical_pets << MagicalPet.new(row[:id], row[:name], row[:pet_owner_id])
    end
    magical_pets
  end
end