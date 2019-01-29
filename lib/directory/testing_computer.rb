module Directory
  class TestingComputer
    def self.turn_on
      puts 'Starting a simulated computer for testing purposes'

      root = Directory::Folder.new('root')
      puts '[Testing computer] Root folder created'
      puts '[Testing computer] Leaving pry context'

      Directory::FileSystem.new(root).boot

      puts '[Testing computer] Simulation ended'
      puts '[Testing computer] Back to pry context'
    end
  end
end
