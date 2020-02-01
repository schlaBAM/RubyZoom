# frozen_string_literal: true
require 'rubyzoom'

module Rubyzoom
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = Rubyzoom::Resolver.call(args)
      Rubyzoom::Executor.call(cmd, command_name, args)
    end
  end
end
