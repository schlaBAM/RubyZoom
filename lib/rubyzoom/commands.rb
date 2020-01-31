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

    register :Example, 'example', 'rubyzoom/commands/example'
    register :Help,    'help',    'rubyzoom/commands/help'
    register :PlayoffRace, 'playoff_race', 'rubyzoom/commands/playoff_race'
    register :PlayerStats, 'player_stats', 'rubyzoom/commands/player_stats'
    register :BadPlayers, 'bad_players', 'rubyzoom/commands/bad_players'
    register :RandomFacts, 'random_facts', 'rubyzoom/commands/random_facts'
  end
end
