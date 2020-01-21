require 'cli/ui'
require 'cli/kit'

CLI::UI::StdoutRouter.enable

module Rubyzoom
  extend CLI::Kit::Autocall

  TOOL_NAME = 'rubyzoom'
  ROOT      = File.expand_path('../..', __FILE__)
  LOG_FILE  = '/tmp/rubyzoom.log'

  autoload(:EntryPoint, 'rubyzoom/entry_point')
  autoload(:Commands,   'rubyzoom/commands')

  autocall(:Config)  { CLI::Kit::Config.new(tool_name: TOOL_NAME) }
  autocall(:Command) { CLI::Kit::BaseCommand }

  autocall(:Executor) { CLI::Kit::Executor.new(log_file: LOG_FILE) }
  autocall(:Resolver) do
    CLI::Kit::Resolver.new(
      tool_name: TOOL_NAME,
      command_registry: Rubyzoom::Commands::Registry
    )
  end

  autocall(:ErrorHandler) do
    CLI::Kit::ErrorHandler.new(
      log_file: LOG_FILE,
      exception_reporter: nil
    )
  end
end
