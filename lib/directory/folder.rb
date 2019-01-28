module Directory
  class Folder
    attr_reader :name
    attr_accessor :parent

    def initialize(name)
      @name = name
      @parent = nil
      @content = []
      @created_at = Time.now
      @updated_at = Time.now
    end

    def add(item)
      item.parent = self
      @content << item
      self
    end

    def full_path
      return @name if parent.nil?

      "#{@parent.full_path}/#{@name}"
    end

    def logical_size
      @content.inject(0) { |summarized, item| summarized + item.logical_size }
    end

    def list
      ["#{full_path} (Folder)", @content.map(&:list)].flatten
    end
  end
end
