
class Goalie < Player

  attr_accessor :wins, :losses, :saves  

  def initialize (name, number, position, goals, assists, wins, losses, saves)
    super(name, number, position, goals, assists)
    @wins = wins
    @losses = losses
    @saves = saves
  end

end
