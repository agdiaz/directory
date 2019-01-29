module Directory
  class TestingComputer
    def self.turn_on
      puts 'Starting a simulated computer for testing purposes'

      root = Directory::Folder.new('root')
        .add(Directory::File.new('readme.md', '#Readme'))
        .add(Directory::File.new('CHANGELOG.md', '#Changelog of gem'))
        .add(Directory::File.new('CONTRIBUTORS.md', '#How to contribute in this project'))
        .add(Directory::Folder.new('src')
          .add(Directory::File.new('main.rb', 'def hello_world; puts "hola"; end'))
          .add(Directory::File.new('spec.rb', 'def hello_world_spec; puts "hello"; end')))

      basic_interpreter = Directory::Interpreter::Basic.new
      file_system = Directory::FileSystem.new(root)

      puts '[Testing computer] Root folder created'
      puts '[Testing computer] Leaving pry context'

      computer = Directory::Computer.new(file_system, basic_interpreter)
      computer.boot

      puts '[Testing computer] Simulation ended'
      puts '[Testing computer] Back to pry context'

      puts "Computer used #{(computer.shutdown_at - computer.started_at)} seconds"
    end
  end
end
