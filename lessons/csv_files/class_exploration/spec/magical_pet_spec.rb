require 'rspec'
require './lib/magical_pet'

RSpec.describe MagicalPet do
  before :each do
    @fluffy = MagicalPet.new(1, 'Fluffy', 1)
  end

  it "exists" do
    expect(@fluffy).to be_a MagicalPet
  end

  it "has attributes of id, name, and pet_owner_id" do
    expect(@fluffy.id).to eq 1
    expect(@fluffy.name).to eq "Fluffy"
    expect(@fluffy.pet_owner_id).to eq 1
  end

  it "can create multiple pet objects" do
    pets = MagicalPet.create_magical_pets("./data/magical_pets.csv")
    first = pets.first

    expect(first).to be MagicalPet
    expect(first.name).to eq "Fluffy"
  end
end