require 'reunion'
require 'activity'

RSpec.describe Reunion do
  before do
    @reunion = Reunion.new("1406 BE")
  end

  describe 'initialize' do
    it 'is a Reunion' do
      expect(@reunion).to be_a(Reunion)
    end
    
    it 'has attributes' do
      expect(@reunion.name).to eq("1406 BE")
      expect(@reunion.activities).to eq([])
    end
  end

  describe 'activities' do
    it 'can add activities' do
      activity_1 = Activity.new("Brunch")
      @reunion.add_activity(activity_1)

      expect(@reunion.activities).to eq([activity_1])
    end
  end

  describe 'reunion calculations' do
    before do
      @activity_1 = Activity.new("Brunch")
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)     
      @activity_2 = Activity.new("Dinner")
      @activity_2.add_participant("Maria", 50)
      @activity_2.add_participant("Luther", 20)  
      @reunion.add_activity(@activity_2)

      @reunion.add_activity(@activity_1)
    end

    it 'can calculate the total cost of the event' do 
      expect(@reunion.event_cost).to eq(130)
    end

    it 'can give the name of each participant and what they owe or are owed' do
      expected = {
        "Maria" => -5,
        "Luther" => 5
      }
      expect(@reunion.total_owed).to eq(expected)
    end

    it 'can give a summary of the runion' do
      expected = "Maria -5\nLuther 5\n"

      expect(@reunion.breakout).to eq(expected)
    end
  end
end