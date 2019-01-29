module Directory
  module Interpreter
    module BasicCommands
      class ChangeDirectoryCommand
        def initialize(arguments, file_system)
          @file_system = file_system
          @new_path = arguments.first
        end

        def execute
          puts "Change directory to #{@new_path}"
          @file_system.change_directory(@new_path)
          puts "Switched to #{@file_system.current_folder.full_path}"
        end
      end
    end
  end
end
