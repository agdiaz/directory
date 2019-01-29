module Directory
  module Interpreter
    module BasicCommands
      class TimeCommand
        def initialize(_arguments, _file_system) end

        def execute
          puts Time.now
        end
      end
    end
  end
end
