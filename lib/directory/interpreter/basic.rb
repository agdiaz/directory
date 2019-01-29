require_relative 'basic_commands/help_command'
require_relative 'basic_commands/echo_command'
require_relative 'basic_commands/time_command'
require_relative 'basic_commands/cat_command'
require_relative 'basic_commands/current_directory_command'
require_relative 'basic_commands/change_directory_command'
require_relative 'basic_commands/list_command'
require_relative './invalid_command_error'

module Directory
  module Interpreter
    class Basic
      def run_command(command, file_system)
        command_name, *arguments = command.split(' ')

        executor =
          case command_name
          when 'help'
            BasicCommands::HelpCommand.new(arguments, file_system)
          when 'echo'
            BasicCommands::EchoCommand.new(arguments, file_system)
          when 'cat'
            BasicCommands::CatCommand.new(arguments, file_system)
          when 'time'
            BasicCommands::TimeCommand.new(arguments, file_system)
          when 'pwd'
            BasicCommands::CurrentDirectoryCommand.new(arguments, file_system)
          when 'ls'
            BasicCommands::ListCommand.new(arguments, file_system)
          when 'cd'
            BasicCommands::ChangeDirectoryCommand.new(arguments, file_system)
          else
            raise InvalidCommandError.new(command)
          end

        executor.execute
      end
    end
  end
end
