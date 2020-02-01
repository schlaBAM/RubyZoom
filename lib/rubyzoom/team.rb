require_relative 'skater'
require_relative '../rubyzoom/goalie'

class Team
  attr_reader :name, :division, :players
  attr_accessor :arena, :record, :standings_position

  def initialize (name, division, record, position)
    @name = name
    @division = division
    @record = record
    @standings_position = position
    @players = []
    @players = generate_players
  end

  def generate_players
    skaters = YAML.load_file('lib/rubyzoom/data.yml')

    skaters['Skater'].each do |skater|
      @players.push(Skater.new(skater['name'], skater['position'], skater['goals'], skater['assists'], skater['shots']))
    end

    skaters['Goalie'].each do |goalie|
      @players.push(Goalie.new(goalie['name'], goalie['position'], goalie['goals'], goalie['assists'], goalie['wins'],
                               goalie['losses'], goalie['saves'], goalie['shots_against']))
    end

    @players.sort_by!{|player| player.total_points}.reverse!
  end

  def to_s
    "#{@standings_position} - #{@name} (#{@record})\n"
  end

  #future use - attribute was removed for now.
  def relocate_arena(new_location)
    @arena = new_location
  end

  def add_players(*new_players)
    new_players.each do |player|
      @players.push(player)
    end
    @players
  end

  def remove_player(player_name)
    @players.each_with_index do |player, index|
      if player.name == player_name
        @players.delete_at(index)
        break
      end
    end
    @players
  end

  def check_roster_size
    roster = Hash.new(0)

    @players.each do |player|
      case player.position
      when 'LW', 'C', 'RW'
        roster[:forward] += 1
      when 'LD', 'RD'
        roster[:defense] += 1
      else
        roster[:goalie] += 1
      end
    end

    forward_size = roster[:forward]
    defense_size = roster[:defense]
    goalie_size = roster[:goalie]
    roster_size = forward_size + defense_size + goalie_size

    forward_size >= 12 && defense_size >= 6 && goalie_size >= 1 && roster_size <= 23
  end

end
