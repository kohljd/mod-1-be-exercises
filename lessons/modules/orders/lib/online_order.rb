# ./online_order.rb
module OnlineOrderable
    def confirmation(thing)
        "You got #{thing}."
    end
    
    def review
        "Please rate your order within 30 days."
    end

#works but not a great way to do it
    # def delivery
    #     if self.class == AmazonOrder
    #         "Your order will arrive in 2 business days."
    #     else
    #         "Your food will arrive in 45-60 minutes."
    #     end
    # end

#dynamic delivery method
    def delivery(item, time_frame)
        "Your #{item} will arrive in #{time_frame}."
    end
end
