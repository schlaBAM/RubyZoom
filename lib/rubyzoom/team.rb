
class Team
  attr_reader :name, :division
  attr_accessor :arena, :current_record, :standings_position

  def initialize (name, division, record, position)
    @name = name
    @division = division
    @current_record = record
    @standings_position = position
    @players = generate_players
  end

  def generate_players

    skaters = YAML.load_file('data.yml')

    skaters['Skater'].each do |skater|
      @players.push(Skater.new(skater['name'], skater['position'], skater['goals'], skater['assists'], skater['shots']))
    end

    skaters['Goalie'].each do |goalie|
      @players.push(Goalie.new(goalie['name'], goalie['position'], goalie['goals'], goalie['assists'], goalie['wins'],
                               goalie['losses'], goalie['saves'], goalie['shots_against']))
    end
  end

  #future use - attribute was removed for now.
  def relocate_arena(new_location)
    @arena = new_location
  end

  def add_players(*players)

    #TODO
    puts players

  end

end
