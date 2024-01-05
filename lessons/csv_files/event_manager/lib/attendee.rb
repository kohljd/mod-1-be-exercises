class Attendee
    attr_reader :id,
                :first_name,
                :last_name,
                :zip_code,
                :name

    def initialize(id, first_name, last_name, zip_code)
        @id = id
        # @first_name = first_name
        # @last_name = last_name
        @name = first_name " " last_name
        @zip_code = clean_zip(zip_code)
    end

    def display
        puts "#{@id}: #{@first_name} #{@last_name}, #{@zip_code}"
    end

    def clean_zip(zipcode)
        if zipcode.nil?
            "00000"
        elsif zipcode.length < 5
            zipcode.rjust(5,"0")
        elsif zipcode.length > 5
            zipcode[0..4]
        else
            zipcode
        end
    end
end