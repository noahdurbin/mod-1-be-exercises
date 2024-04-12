class AnimalLover
  attr_reader :id, :first_name, :last_name, :age

  def initialize(id, first_name, last_name, age)
    @id = id.to_i
    @first_name = first_name
    @last_name = last_name
    @age = age.to_i
  end

  def full_name
    @first_name + " " + @last_name
  end
end