module Directory
  module Interpreter
    module BasicCommands
      class EchoCommand
        def initialize(arguments, _file_system)
          @arguments = arguments.join(' ')
        end

        def execute
          puts @arguments
        end
      end
    end
  end
end
