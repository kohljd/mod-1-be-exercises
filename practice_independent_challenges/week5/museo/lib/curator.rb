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
        gallery = list_artists_works
        gallery.transform_values! {|photos| photos.count}
        gallery.filter_map {|artist, work_number| artist.name if work_number > 1}
    end

    def photos_from_country(country)
        gallery = list_artists_works
        gallery.filter_map {|artist, photos| photos if artist.country == country}.flatten
    end

    def photos_within(start_date, end_date)
        #code
    end

    def artist_age_for(photo)
        photo = @photographs.find {|picture| picture == photo}
        artist = @artists.find {|artist| artist.id == photo.artist_id}
        
        photo.year.to_i - artist.born.to_i
    end
end