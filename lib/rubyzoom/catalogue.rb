
class Catalogue

  def initialize
    @teams = YAML.load_file('data.yml')['Team'].sort_by(&:team.position)
    @team = generate_team
    @free_agents = generate_free_agents
  end

  def generate_team
    @teams.each_with_index do |index, team|
      if team['name'].include?('Canucks')
        result = @teams[index]
        #TODO - handle errors here
        return Team.new(result['name'], result['division'], result['record'], result['position'])
      end
    end
  end

  def generate_free_agents
    #TODO - data still needs to be created
  end

  # -- Global Team Functions
  def get_playoff_standings
    @teams.partition { |team| team.position <= 8}[0]
  end

  def get_best_team
    @teams[0]
  end

  def get_teams_from(division)
    @teams.select{|team| team.division == division}
  end

  def print_current_standings
    result = "Current standings:\n"

    @teams.each do |team|
      result += "#{team.standings_position} - #{team.name} (#{team.record}\n"
    end
  end

  #Individual Team Functions
  def get_team_total_player_points
    @team.players.reduce{|sum, player| sum + player.total_points}
  end

  def get_best_player
    @team.players.max_by {|player| player.total_points}
  end

  def get_bad_players
    @team.players.select {|player| player.total_points < 10 && player.position != 'G'}
  end

end

=begin

BeAGM - console person is GM.

UI Greet, grab name and have them select one of the available teams to generate instance.

UI Main menu -

(done) Analyze team: current place, record, standings etc
TODO - Analyze coach: morale with team, overall record with team
(done) Analyze players: kick off team, analyze stats, top players, etc
removal of X requires check to ensure team stats are still met (roster numbers, has a coach, etc)

CRUD: player stats, coach stats, team stats (including individual players / coaches)

GM - fire coach, trade player, ??

Collection ideas:

Partition: currently_in_playoffs? partition 8 teams that are currently in the playoffs
Map: ezpz
Reduce: get_total_team_points - grab each player's point totals and return result.
Select: find_best_scorer - select highest point getter on team

easter egg commands to get fined / fired etc

=end
