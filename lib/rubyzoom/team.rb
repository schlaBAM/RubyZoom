
class Team
  attr_reader :name, :division
  attr_accessor :arena, :current_record, :standings_position

  def initialize (name, arena, division, record, position)
    @name = name
    @arena = arena
    @division = division
    @current_record = record
    @standings_position = position
    @players = generate_players(team)
  end

  def generate_players(team)
    # get team in yaml file
    # for each player in team hash add to players array
  end

  def relocate_arena(new_location)
    @arena = new_location
  end

  def add_players(players)

  end

end
