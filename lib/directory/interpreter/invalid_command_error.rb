module Directory
  module Interpreter
    class InvalidCommandError < RuntimeError
      def initialize(command)
        @command = command
        super
      end

      def message
        "Invalid command `#{@command}`. Write `help` to get the available command list"
      end
    end
  end
end
