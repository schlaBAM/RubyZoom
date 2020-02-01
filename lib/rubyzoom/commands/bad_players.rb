# frozen_string_literal: true
require 'rubyzoom'
require_relative '../../../lib/rubyzoom/catalogue'

module Rubyzoom
  module Commands
    class BadPlayers < Rubyzoom::Command
      def call(_args, _name)
        catalog = Catalogue.new
        puts "Current under-performing players:\n"
        puts catalog.bad_players
      end

      def self.help
        "Returns under-performing players (less than 10 points).\nUsage: {{command:#{Rubyzoom::TOOL_NAME} bad_players}}"
      end
    end
  end
end
