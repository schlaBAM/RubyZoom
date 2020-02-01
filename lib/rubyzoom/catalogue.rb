# frozen_string_literal: true
require 'yaml'
require_relative '../rubyzoom/team'

class Catalogue
  attr_reader :team, :teams

  def initialize
    file = YAML.load_file('lib/rubyzoom/data.yml')['Team']
    @teams = []
    generate_teams(file)
    @teams = @teams.sort_by(&:standings_position)
    @team = generate_team
    # @free_agents = generate_free_agents
  end

  # -- Global Team Functions
  def playoff_standings
    result = @teams.partition { |team| team.standings_position <= 8 }

    "\nCurrently in playoff position:\n#{teams_to_string(result[0])}\nOn the outside looking in:\n#{teams_to_string(result[1])}"
  end

  def best_team
    teams_to_string([@teams.min_by(&:standings_position)])
  end

  def teams_from(division)
    division_teams = @teams.select { |team| team.division == division }
    teams_to_string(division_teams)
  end

  def print_current_standings
    "Current standings:\n#{teams_to_string(@teams)}"
  end

  # Individual Team Functions
  def team_total_player_points
    @team.players.reduce(0) { |sum, player| sum + player.total_points }
  end

  def best_player
    best_player = @team.players.max_by(&:total_points)
    players_to_string([best_player])
  end

  def bad_players
    bad_players = @team.players.select { |player| player.total_points < 10 && player.position != 'G' }
    players_to_string(bad_players)
  end

  def goalie_stats
    @team.players.select { |player| player.class == Goalie }
  end

  private

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

  def teams_to_string(teams)
    result = ''
    teams.each do |team|
      result += team.to_s
    end
    result
  end

  def players_to_string(players)
    result = ''
    players.each do |player|
      result += player.to_s
    end
    result
  end

  # def generate_free_agents
  #  #TODO - data still needs to be created
  # end
end
