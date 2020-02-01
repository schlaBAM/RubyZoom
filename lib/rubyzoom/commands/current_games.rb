# frozen_string_literal: true
require 'rubyzoom'
require 'NHLGem'

module Rubyzoom
  module Commands
    class CurrentGames < Rubyzoom::Command
      def call(_args, _name)
        puts NHLGem.check_games
      end

      def self.help
        "Calls NHL's API to see if there are any hockey games on.\nUsage: {{command:#{Rubyzoom::TOOL_NAME} current_games}}"
      end
    end
  end
end
