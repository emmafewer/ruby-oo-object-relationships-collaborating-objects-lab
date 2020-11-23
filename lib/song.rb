class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(path)
        song = path.split(" - ")[1]
        artist = path.split(" - ")[0]
        song = Song.new(song)
        song.artist = Artist.new(artist)
        song
    end


    def self.find_by_name(name)
        self.all.find{|song| song.artist == name}
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.all
        @@all
    end
end