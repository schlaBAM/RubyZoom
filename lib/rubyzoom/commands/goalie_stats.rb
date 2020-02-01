# frozen_string_literal: true
require 'rubyzoom'
require_relative '../../../lib/rubyzoom/catalogue'

module Rubyzoom
  module Commands
    class GoalieStats < Rubyzoom::Command
      def call(_args, _name)
        catalog = Catalogue.new
        goalies = catalog.goalie_stats
        puts "\nCurrent goalie stats:\n"
        goalies.each do |goalie|
          puts goalie.to_s
        end
      end

      def self.help
        "Returns current stats for your goalie.\nUsage: {{command:#{Rubyzoom::TOOL_NAME} goalie_stats}}"
      end
    end
  end
end
