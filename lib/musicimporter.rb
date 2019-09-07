class MusicImporter
  attr_reader :path

  def initialize (filepath)
    @path = filepath
  end

  def files
    puts @path
  end
end
