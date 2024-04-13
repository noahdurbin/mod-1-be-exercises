class Attendee
  
  attr_reader :id, 
              :first_name, 
              :last_name, 
              :zipcode, 
              :name

  def initialize(id, first_name, last_name, zipcode)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @zipcode = zipcode
    @name = first_name + " " + last_name
  end

  
end
