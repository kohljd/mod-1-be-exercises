# 1. Using #each, write the code to find the first sister over four letters in length.
# 2. Once you get the method below to work using #each, refactor your code to use #find. 

#Method using `.each`
    # def find_first_long_named_sister
    #     sisters = ["Rose", "Kathleen", "Eunice", "Patricia", "Jean"]

    #     sisters.each do |name|
    #         if sisters.length > 4
    #             return name
    #         end
    #     end
    # end

#Another way
def find_first_long_named_sister
    sisters = ["Rose", "Kathleen", "Eunice", "Patricia", "Jean"]

    sisters.find {|name| name.length > 4}
end


p find_first_long_named_sister