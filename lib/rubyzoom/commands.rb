require 'rubyzoom'

module Rubyzoom
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(
      default: 'help',
      contextual_resolver: nil
    )

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :Help,    'help',    'rubyzoom/commands/help'
    register :PlayoffRace, 'playoff_race', 'rubyzoom/commands/playoff_race'
    register :CurrentGames, 'current_games', 'rubyzoom/commands/current_games'
    register :PlayerStats, 'player_stats', 'rubyzoom/commands/player_stats'
    register :GoalieStats, 'goalie_stats', 'rubyzoom/commands/goalie_stats'
    register :BadPlayers, 'bad_players', 'rubyzoom/commands/bad_players'
    register :RandomFacts, 'random_facts', 'rubyzoom/commands/random_facts'

    #TODO - display players, and possibly have another command (or same one) to show details?
    # *if time permits.*

  end
end
