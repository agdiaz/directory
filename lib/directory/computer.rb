module Directory
  class Computer
    attr_reader :started_at, :shutdown_at

    def initialize(file_system, command_interpreter)
      @file_system = file_system
      @command_interpreter = command_interpreter
    end

    def boot
      @started_at = Time.now
      puts "#{Time.now} [COMPUTER] booting from #{@file_system.current_folder.full_path}... "

      while true
        begin
          printf "#{Time.now} [COMPUTER] #{@file_system.current_folder.name} $ "
          command = gets.chomp
          break if command == 'shutdown'

          @command_interpreter.run_command(command, @file_system)
        rescue Interpreter::InvalidCommandError => error
          puts "#{Time.now} [COMPUTER] <INTERPRETER ERROR> #{error.message}"
        rescue StandardError => error
          puts "#{Time.now} [COMPUTER] <FATAL ERROR> #{error.message}"
          puts "#{Time.now} [COMPUTER] <FATAL ERROR> Shutting down right now"
          raise error
        end
      end

      shutdown
    end

    def shutdown
      @shutdown_at = Time.now
      puts "#{Time.now} [COMPUTER] shutdown... "
    end
  end
end
