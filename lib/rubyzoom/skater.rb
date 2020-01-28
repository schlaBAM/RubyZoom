
class Skater < Player

  def initialize(name, number, position, goals, assists)
    super(name, number, position)
    @goals = goals
    @assists = assists

  end
end
