require 'rubyzoom'
require_relative '../../../lib/rubyzoom/catalogue'

module Rubyzoom
  module Commands
    class RandomFacts < Rubyzoom::Command

      def call(args, _name)
        catalog = Catalogue.new
        puts "\n----- Random Facts -----"
        puts "Top team in the league: #{catalog.get_best_team}"
        puts "\nPacific Division teams (by overall conference placing):\n#{catalog.get_teams_from('Pacific')}"
        puts "\nCentral Division teams (by overall conference placing):\n#{catalog.get_teams_from('Central')}"

      end

      def self.help
        "Returns a collection of random facts. Surprise!\nUsage: {{command:#{Rubyzoom::TOOL_NAME} random_facts}}"
      end
    end
  end
end
