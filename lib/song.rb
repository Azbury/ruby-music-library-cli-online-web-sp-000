class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name (name)
    if self.find_by_name(name) == false
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def genre= (genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create (name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
end
