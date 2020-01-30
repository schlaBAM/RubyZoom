
class Catalogue

  def initialize(team)
    @teams = YAML.load_file('data.yml')['Team']
    @team = generate(team)
  end

  def generate(team)
    @file['Team'].each_with_index do |index, team|
      if team['name'].include?('Canucks')
        result = @file['Team'][index]
        #TODO - handle errors here
        return Team.new(result['name'], result['division'], result['record'], result['position'])
      end
    end
  end

  def generate_players_for_team
    @players = @file['Skater'] + @file['Goalie']
    @players.sort_by!{|player| player['points']}.reverse!
  end

  def generate_free_agents
    #TODO - data still needs to be created
  end

  def get_playoff_standings
    @teams.partition { |team| team['position'] <= 8}[0]
  end

  def get_best_team
    @teams = @teams.sort_by(&:position)
    @teams[0]
  end

  def get_team_points_total
    @team.players.reduce(&:+)
  end

  def get_best_player
    @players.max_by {|player| player['points']}
  end

  def get_bad_players
    @players.select {|player| player['points'] < 10 && player['position'] != 'G'}
  end



end
