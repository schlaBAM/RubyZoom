# frozen_string_literal: true
require 'rubyzoom'
require_relative '../../../lib/rubyzoom/catalogue'

module Rubyzoom
  module Commands
    class PlayerStats < Rubyzoom::Command
      def call(_args, _name)
        catalog = Catalogue.new
        puts "Player stats:"
        puts "Collectively this season, #{catalog.team.name} players have scored #{catalog.team_total_player_points} points."
        puts "Your current top scorer is #{catalog.best_player}"
      end

      def self.help
        "Prints player stats for team. Total points, highest scorer.\nUsage: {{command:#{Rubyzoom::TOOL_NAME} player_stats}}"
      end
    end
  end
end
