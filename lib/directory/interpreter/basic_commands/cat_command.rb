module Directory
  module Interpreter
    module BasicCommands
      class CatCommand
        def initialize(arguments, file_system)
          @filepath = arguments.join(' ')
          @file_system = file_system
        end

        def execute
          if @file_system.current_folder.exists?(@filepath)
            file = @file_system.current_folder.find(@filepath)
            file.cat
          else
            puts 'File not found'
          end
        end
      end
    end
  end
end
