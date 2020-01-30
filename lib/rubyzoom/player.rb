class Player
  attr_reader :name, :position
  attr_accessor :goals, :assists

  def initialize (name, position, goals, assists)
    @name = name
    @position = position
    @goals = goals
    @assists = assists
  end

  def total_points
    @goals + @assists
  end

end
