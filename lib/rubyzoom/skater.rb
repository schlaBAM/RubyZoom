require_relative 'player'

class Skater < Player

  attr_reader :shots

  def initialize(name, position, goals, assists, shots)
    super(name, position, goals, assists)
    @shots = shots
  end

  def shot_percentage
    ((@goals.to_f / @shots) * 100).round(2)
  end

  def to_s
    "#{@name} (#{@goals}G, #{@assists}A, #{total_points}P) with a #{shot_percentage}% shot percentage.\n"
  end
end
