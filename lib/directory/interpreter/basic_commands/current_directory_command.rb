module Directory
  module Interpreter
    module BasicCommands
      class CurrentDirectoryCommand
        def initialize(_arguments, file_system)
          @file_system = file_system
        end

        def execute
          puts @file_system.current_folder.full_path
        end
      end
    end
  end
end
