class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def add_song (song)
    song.artist = self if song.artist != nil
    self.songs << song if !self.songs.include?(song)
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
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end
end
