class MusicImporter
  attr_reader :path

  def initialize (filepath)
    @path = filepath
  end

  def files
    Dir.entries(self.path)
  end
end
