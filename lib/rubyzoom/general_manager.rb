
class GeneralManager

  attr_reader :name
  attr_accessor :team

  def initialize(name, team)
    @name = name
    @team = generate_team(team)
  end

  def generate_team(team_name)
    # grab team from YML file with info on team.
    # on initialization team class will generate players
    # team sent to this function will choose from enum of teams to ensure string match.
    teams =
        [
    Team.new('Vancouver Canucks', 'Rogers Arena', 'Pacific', '28-18-4', 1),
    Team.new('Edmonton Oilers', 'Rogers Place', 'Pacific', '26-18-5', 2),
    Team.new('Calgary Flames', 'Scotiabank Saddledome', 'Pacific', '26-19-5', 3),
    Team.new('Arizona Coyotes', 'Gila River Arena', 'Pacific', '26-20-5', 4),
    Team.new('Vegas Golden Knights', 'T-Mobile Arena', 'Pacific', '25-20-7', 5),
    Team.new('San Jose Sharks', 'SAP Center', 'Pacific', '22-25-4', 6),
    Team.new('Anaheim Ducks', 'Honda Center', 'Pacific', '19-25-5', 7),
    Team.new('LA Kings', 'Staples Center', 'Pacific', '18-27-5', 8)
    ]

    teams.each_with_index do |index, team|
      if team.name == team_name
        return teams[index]
      end
    end

    #it'll never hit here because of data control but for safety:
    teams[0]
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

easter egg commands to get fined / fired etc

=end