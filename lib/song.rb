class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre
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
