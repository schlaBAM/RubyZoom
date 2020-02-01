require 'rubyzoom'

module Rubyzoom
  module Commands
    class CurrentGames < Rubyzoom::Command

      def call(_args, _name)
        #TODO: implement gem + call check_games
      end

      def self.help
        "Calls NHL's API to see if there are any hockey games on.\nUsage: {{command:#{Rubyzoom::TOOL_NAME} current_games}}"
      end

    end
  end
end
