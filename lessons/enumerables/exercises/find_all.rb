# 1. Using #each, write the code to find all the numbers divisible by 3
# 2. Once you get the method below to work using #each, refactor your code to use #find_all. 

#Method using `.each`
    # def find_all_nums_divisible_by_3
    #     numbers = [1,2,3,4,5,6,7,8,9]
        
    #     numbers.each do |number|
    #         if number % 3 == 0
    #         numbers.push(number)
    #         end
    #     end
    #     numbers
    #     # should return [3,6,9]
    # end

def find_all_nums_divisible_by_3
    numbers = [1,2,3,4,5,6,7,8,9]

    numbers.find_all {|number| number % 3 == 0}

end

p find_all_nums_divisible_by_3