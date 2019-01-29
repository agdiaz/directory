module Directory
  module Interpreter
    module BasicCommands
      class HelpCommand
        def initialize(_arguments, _file_system) end

        def execute
          puts 'Available commands:'
          puts "\t help"
          puts "\t time"
          puts "\t echo <arguments>"
          puts "\t shutdown"
          puts "\t pwd"
          puts "\t ls"
          puts "\t cd <foldername>"
          puts "\t touch <filename>"
          puts "\t cat <filename>"
        end
      end
    end
  end
end
