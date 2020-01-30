
class Goalie < Player

  attr_accessor :wins, :losses, :saves, :shots_against

  def initialize (name, position, goals, assists, wins, losses, saves, shots_against)
    super(name, position, goals, assists)
    @wins = wins
    @losses = losses
    @saves = saves
    @shots_against = shots_against
  end

  def get_save_percentage
    (@shots_against.to_f / @saves).round(3)
  end
end
