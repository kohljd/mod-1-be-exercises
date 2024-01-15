require './spec/spec_helper'

RSpec.describe Curator do
    before(:each) do
        @curator = Curator.new
    end

    it 'exists' do
        expect(@curator).to be_an_instance_of(Curator)
    end

    it 'starts with no photographs' do
        expect(@curator.photographs).to eq([])
    end

    it 'can add photographs' do
        photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
        })
        @curator.add_photograph(photo_1)
        expect(@curator.photographs).to eq([photo_1])
    end

    it 'starts with no artists' do
        expect(@curator.artists).to eq([])
    end

    it 'can add artists' do
        artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
        })
        @curator.add_artist(artist_1)
        
        expect(@curator.artists).to eq([artist_1])
    end

    it 'can find artist by id' do
        artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
        })
        artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
        })
        @curator.add_artist(artist_1)
        @curator.add_artist(artist_2)

        expect(@curator.find_artist_by_id("1")).to eq(artist_1)
    end

    it 'can list artists & photos' do
        photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
        })
        photo_2 = Photograph.new({
            id: "2",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
        })
        artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
        })
        artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
        })

        @curator.add_photograph(photo_1)
        @curator.add_photograph(photo_2)
        @curator.add_artist(artist_1)
        @curator.add_artist(artist_2)

        expect(@curator.list_artists_works).to eq({artist_1 => [photo_1], artist_2 => [photo_2]})
    end

    it 'can list artists with multiple works' do
        photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
        })
        photo_2 = Photograph.new({
            id: "1",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
        })
        artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
        })
        artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
        })

        @curator.add_photograph(photo_1)
        @curator.add_photograph(photo_2)
        @curator.add_artist(artist_1)
        @curator.add_artist(artist_2)

        expect(@curator.artists_with_multiple_works).to eq(artist_1.name)
    end

    it 'can list photos by artist country' do
        photo_1 = Photograph.new({
            id: "1",      
            name: "Rue Mouffetard, Paris (Boy with Bottles)",      
            artist_id: "1",      
            year: "1954"      
        })
        photo_2 = Photograph.new({
            id: "1",      
            name: "Moonrise, Hernandez",      
            artist_id: "2",      
            year: "1941"      
        })
        artist_1 = Artist.new({
            id: "1",      
            name: "Henri Cartier-Bresson",      
            born: "1908",      
            died: "2004",      
            country: "France"      
        })
        artist_2 = Artist.new({
            id: "2",      
            name: "Ansel Adams",      
            born: "1902",      
            died: "1984",      
            country: "United States"      
        })

        @curator.add_photograph(photo_1)
        @curator.add_photograph(photo_2)
        @curator.add_artist(artist_1)
        @curator.add_artist(artist_2)

        expect(@curator.photos_from_country("France")).to eq([photo_1])
    end
end