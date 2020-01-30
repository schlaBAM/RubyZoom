
class GeneralManager

  attr_reader :name
  attr_accessor :team

  def initialize(name, team)
    @name = name
    @teams = generate_teams
    @team = get_team(team)
  end

  def generate_teams
    # grab team from YML file with info on team.
    # on initialization team class will generate players
    # team sent to this function will choose from enum of teams to ensure string match.
    [
        Team.new('St Louis Blues', 'Enterprise Center', 'Central', '30-12-8', 1),
        Team.new('Colorado Avalanche', 'Pepsi Center', 'Central', '28-15-6', 2),
        Team.new('Vancouver Canucks', 'Rogers Arena', 'Pacific', '28-18-4', 3),
        Team.new('Dallas Stars', 'American Airlines Center', 'Central', '28-18-4', 4),
        Team.new('Edmonton Oilers', 'Rogers Place', 'Pacific', '26-18-5', 5),
        Team.new('Calgary Flames', 'Scotiabank Saddledome', 'Pacific', '26-19-5', 6),
        Team.new('Arizona Coyotes', 'Gila River Arena', 'Pacific', '26-20-5', 7),
        Team.new('Vegas Golden Knights', 'T-Mobile Arena', 'Pacific', '25-20-7', 8),
        Team.new('Winnipeg Jets', 'Bell MTS Place', 'Central', '25-22-4', 9),
        Team.new('Chicago Blackhawks', 'United Center', 'Central', '24-21-6', 10),
        Team.new('Minnesota Wild', 'Xcel Energy Center', 'Central', '23-21-6', 11),
        Team.new('Nashville Predators', 'Bridgestone Arena', 'Central', '22-19-7', 12),
        Team.new('San Jose Sharks', 'SAP Center', 'Pacific', '22-25-4', 13),
        Team.new('Anaheim Ducks', 'Honda Center', 'Pacific', '19-25-5', 14),
        Team.new('LA Kings', 'Staples Center', 'Pacific', '18-27-5', 15)
    ]

  end

  def get_team(team_name)
    @teams.each_with_index do |index, team|
      if team.name == team_name
        return @teams[index]
      end
    end

    # it'll never hit here because of data control but for safety:
    @teams[0]
  end

end

=begin

BeAGM - console person is GM.

UI Greet, grab name and have them select one of the available teams to generate instance.

UI Main menu -

Analyze team: current place, record, standings etc
Analyze coach: morale with team, overall record with team
Analyze players: kick off team, analyze stats, top players, etc
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