require 'yaml'
require_relative '../rubyzoom/team'

class Catalogue

  attr_reader :team

  def initialize
    file =  YAML.load_file('lib/rubyzoom/data.yml')['Team']
    @teams = []
    generate_teams(file)
    @teams = @teams.sort_by{ |team| team.standings_position}
    @team = generate_team
    @free_agents = generate_free_agents
  end


  # -- Global Team Functions
  def get_playoff_standings
    result = @teams.partition { |team| team.standings_position <= 8}

    str = "\nCurrently in playoff position:\n#{team_to_string(result[0])}"
    str += "\nOn the outside looking in:\n#{team_to_string(result[1])}"

  end

  def get_best_team
    team_to_string([@teams.min_by{|team| team.standings_position}])
  end

  def get_teams_from(division)
    division_teams = @teams.select{|team| team.division == division}
    team_to_string(division_teams)
  end

  def print_current_standings
    "Current standings:\n#{team_to_string(@teams)}"
  end

  #Individual Team Functions
  def get_team_total_player_points
    @team.players.reduce(0) {|sum, player| sum + player.total_points}
  end

  def get_best_player
    best_player = @team.players.max_by {|player| player.total_points}
    players_to_string([best_player])
  end

  def get_bad_players
    bad_players = @team.players.select {|player| player.total_points < 10 && player.position != 'G'}
    players_to_string(bad_players)
  end

  private

  #todo - get rid of generate_team and assign @team to canucks here.
  def generate_teams(file)
    file.each do |team|
      @teams.push(Team.new(team['name'], team['division'], team['record'], team['position']))
    end
  end

  def generate_team
    @teams.each_with_index do |team, index|
      if team.name.include?('Canucks')
        return @teams[index]
      end
    end
  end

  def generate_free_agents
    #TODO - data still needs to be created
  end

  def team_to_string(array)
    result = ''
    array.each do |team|
      result += "#{team.standings_position} - #{team.name} (#{team.record})\n"
    end
    result
  end

  def players_to_string(players)
    players.each do |player|
      puts "#{player.name} (#{player.goals}G, #{player.assists}A, #{player.total_points}P)"
    end
  end

end

=begin

BeAGM - console person is GM.

UI Main menu -


CRUD: player stats, coach stats, team stats (including individual players / coaches)

GM - fire coach, trade player, ??

Collection ideas:

Partition: currently_in_playoffs? partition 8 teams that are currently in the playoffs
Map: ezpz
Reduce: get_total_team_points - grab each player's point totals and return result.
Select: find_best_scorer - select highest point getter on team

easter egg commands to get fined / fired etc

=end
