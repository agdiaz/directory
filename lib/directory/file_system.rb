module Directory
  class FileSystem
    def initialize(mount_folder)
      @mount_folder = mount_folder
    end

    def boot
      puts "#{Time.now} booting from #{@mount_folder.full_path}... "

      while @command != 'unmount'
        printf "#{Time.now} [FILESYSTEM] #{@mount_folder.name} $ "

        @command = gets.chomp
        command_interpreter
      end

      unmount
    end

    def command_interpreter
      command_name, *arguments = @command.split(' ')
      case command_name
      when 'help'
        help
      when 'echo'
        echo(arguments)
      when 'time'
        time
      when 'unmount'
        # file system will be unmounted soon
      else
        puts "Invalid command. Write `help` to get the available command list"
      end
    end

    def help
      puts 'File system HELP'
      puts 'Available commands:'
      puts "\t help"
      puts "\t time"
      puts "\t echo"
      puts "\t unmount"
    end

    def time
      puts Time.now
    end

    def echo(text)
      puts text
    end

    def unmount
      puts "#{Time.now} unmounting... "
    end
  end
end
