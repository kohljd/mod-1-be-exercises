class Appointments
    
    attr_reader :slot
    
    def initialize
        @slot = slot
        @slot_list = []
    end

    def at(t)
       @slot = Time.at(t)
       @slot_list.push(@slot)
       @slot_list
    end

    def earliest
        @slot_list.min
    end
end