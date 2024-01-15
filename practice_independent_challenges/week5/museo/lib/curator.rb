class Curator
    attr_reader :artists,
                :photographs

    def initialize
        @artists = []
        @photographs = []
    end

    def add_photograph(photo)
        @photographs << photo
    end

    def add_artist(artist)
        @artists << artist
    end

    def find_artist_by_id(artist_id)
        @artists.find {|artist| artist.id == artist_id}
    end

    def list_artists_works
        @artists.to_h {|artist| [artist, @photographs.select{|photo| photo.artist_id == artist.id}]}
    end

    def artists_with_multiple_works
        #code
    end

    def photos_from_country(country)
        #code
    end
end