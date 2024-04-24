class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name 
    @participants = Hash.new(0)
  end

  def add_participant(name, paid)
    @participants[name] = paid
  end

  def total_cost
    participants.sum do |name, paid|
      paid
    end
  end

  def split
    total_cost / participants.length
  end

  def owed
    amt_owed = Hash.new(0)
    participants.each do |name, paid|
      amt_owed[name] = split - paid
    end
    amt_owed
  end
end