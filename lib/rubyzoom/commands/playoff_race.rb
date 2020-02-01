require 'rubyzoom'
require_relative '../../../lib/rubyzoom/catalogue'

module Rubyzoom
  module Commands
    class PlayoffRace < Rubyzoom::Command
      def call(_args, _name)
        catalog = Catalogue.new
        puts catalog.playoff_standings
      end

      def self.help
        "Prints playoff race for Western Conference. \nUsage: {{command:#{Rubyzoom::TOOL_NAME} playoff_race}}"
      end
    end
  end
end