class Player
  attr_reader :name, :number, :position
  attr_accessor :goals, :assists, :points

  def initialize (name, number, position, goals, assists)
    @name = name
    @number = number
    @position = position
    @goals = goals
    @assists = assists
    @points = goals + assists
  end

end
