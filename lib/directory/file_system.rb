module Directory
  class FileSystem
    attr_reader :current_folder
    def initialize(mount_folder)
      @root = mount_folder
      @current_folder = @root
    end

    def change_directory(folder_name)
      return upper_folder if folder_name == '..'
      return unless @current_folder.exists?(folder_name)
      selected_folder = @current_folder.find(folder_name)

      @current_folder = selected_folder if selected_folder.folder?
    end

    def upper_folder
      return if @current_folder == @root
      @current_folder = @current_folder.parent
    end
  end
end
