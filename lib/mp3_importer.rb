class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        filename = Dir.chdir(@path) do |path|
            Dir.glob("*.mp3")
        end
        filename
    end

    # def files
    #     file = Dir[@path+"/*"]
    #     file = file.map {|file| File.basename(file)}
    # end

    def import 
        files.each{|file| Song.new_by_filename(file)}
    end
end