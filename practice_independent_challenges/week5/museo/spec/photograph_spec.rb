require './spec/spec_helper'

RSpec describe Photograph do
    before(:each) do
        @photograph = Photograph.new(@attributes)
        @attributes = {
            id: "1",
            name: "Rue Mouffetard, Paris (Boy with Bottles)",
            artist_id: "4",
            year: "1954"
          }
    end

    it 'exists' do
        expect(@photograph).to be_an_instance_of(Photograph)
    end

    it 'has attributes' do
        expcet(@photograph.id).to eq("1")
        expcet(@photograph.name).to eq("Rue Mouffetard, Paris (Boy with Bottles)")
        expcet(@photograph.artist_id).to eq("4")
        expcet(@photograph.year).to eq("1954")
    end
end