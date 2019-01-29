module Directory
  module Interpreter
    module BasicCommands
      class ListCommand
        def initialize(_arguments, file_system)
          @file_system = file_system
        end

        def execute
          puts @file_system.current_folder.list
        end
      end
    end
  end
end
