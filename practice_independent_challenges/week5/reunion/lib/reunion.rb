class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities.push(activity)
  end

  def event_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def total_owed
    total = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, owed|
        total[name] += owed
      end
    end
    total
  end

  def breakout
    breakout_summary = []
    total_owed.each do |name, owed|
      breakout_summary << "#{name} #{owed}" + ("\n")
    end
    breakout_summary.join
  end
end