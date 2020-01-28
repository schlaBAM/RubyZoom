
class GeneralManager

  attr_reader :name
  attr_accessor :team

  def initialize(name, team)
    @name = name
    @team = team
  end


end

=begin

BeAGM - console person is GM.

Analyze team: current place, record, standings etc
Analyze coach: morale with team, overall record with team
Analyze players: kick off team, analyze stats, top players, etc

CRUD: player stats, coach stats, team stats (including individual players / coaches)

GM - fire coach, trade player,

=end