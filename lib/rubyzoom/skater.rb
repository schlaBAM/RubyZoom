
class Skater < Player

  attr_reader :shots

  def initialize(name, position, goals, assists, shots)
    super(name, position, goals, assists)
    @shots = shots
  end

  def get_shot_percentage
    (@goals.to_f / @shots).round(2) * 100
  end
end
