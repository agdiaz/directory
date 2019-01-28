module Directory
  class File
    attr_reader :name, :content
    attr_accessor :parent

    def initialize(name, content = '')
      @name = name
      @content = content
      @created_at = Time.now
      @updated_at = Time.now
    end

    def write(new_content)
      @content = new_content
      @updated_at = Time.now
    end

    def full_path
      "#{@parent.full_path}/#{@name}"
    end

    def cat
      puts @content
    end

    def logical_size
      @content.size * 8
    end

    def list
      "#{full_path} (#{logical_size} Bytes)"
    end
  end
end
