# frozen_string_literal: true
require 'rubyzoom'
require_relative '../../../lib/rubyzoom/catalogue'

module Rubyzoom
  module Commands
    class Help < Rubyzoom::Command
      def call(_args, _name)
        catalogue = Catalogue.new

        puts "- Welcome to Be A GM -"
        puts "Welcome back, Jim Benning. As General Manager of the Vancouver Canucks, here are the current standings:"
        puts catalogue.print_current_standings
        puts CLI::UI.fmt("\n{{bold:Available commands}}:")
        puts ""

        Rubyzoom::Commands::Registry.resolved_commands.each do |name, klass|
          next if name == 'help'
          puts CLI::UI.fmt("{{command:#{Rubyzoom::TOOL_NAME} #{name}}}")
          if help = klass.help
            puts CLI::UI.fmt(help)
          end
          puts ""
        end
      end
    end
  end
end
