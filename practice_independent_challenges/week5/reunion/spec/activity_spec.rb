require 'activity'

RSpec.describe Activity do
  before do
    @activity = Activity.new("Brunch")
  end

  describe 'initialize' do
    it 'can initialize an activity' do
      expect(@activity).to be_a(Activity)
    end

    it 'has attributes' do
      expect(@activity.name).to eq("Brunch")
      expect(@activity.participants).to eq({})
    end
  end

  describe 'add participants' do
    it 'can add participants to the activity hash' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expected = {
        "Maria" => 20,
        "Luther" => 40
      }
      expect(@activity.participants).to eq(expected)
    end
  end

  describe 'cost of activity' do
    it 'can calculate total cost of an activity' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.total_cost).to eq(60)
    end
  end

  describe 'split' do
    it 'can split the cost of an activity evenly among all participants' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.split).to eq(30)
    end

    it 'can tell each participant what they owe or are owed' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expected = {
        "Maria" => 10,
        "Luther" => -10
      }

      expect(@activity.owed).to eq(expected)
    end
  end
end