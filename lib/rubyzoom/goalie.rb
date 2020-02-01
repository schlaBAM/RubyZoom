
class Goalie < Player

  attr_accessor :wins, :losses, :saves, :shots_against

  def initialize (name, position, goals, assists, wins, losses, saves, shots_against)
    super(name, position, goals, assists)
    @wins = wins
    @losses = losses
    @saves = saves
    @shots_against = shots_against
  end

  def save_percentage
    (@saves.to_f / @shots_against).round(3)
  end

  def to_s
    "#{@name} has #{@wins} wins, #{@losses} losses. Of the #{@shots_against} shots faced, he has made #{@saves} saves giving him a #{save_percentage} save percentage.\n"
  end

end
