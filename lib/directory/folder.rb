module Directory
  class Folder < File
    def initialize(name, content = [])
      super
    end

    # File Type
    def cat
      raise "#{name} is a folder."
    end

    def edit(_content)
      raise "#{name} is a folder."
    end

    def full_path
      return name if parent.nil?

      "#{parent.full_path}/#{name}"
    end

    def logical_size
      content.inject(0) { |summarized, file| summarized + file.logical_size }
    end

    def list
      ["#{full_path} (Folder)", content.map(&:list)].flatten
    end

    # Folder type

    def add(file)
      file.parent = self
      @content << file
      self
    end
  end
end
