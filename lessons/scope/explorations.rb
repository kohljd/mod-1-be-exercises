require 'pry'
#### GLOBAL SCOPE
    ## Example 1
        # x = 10
        # # need to add `y = [a value]` here in order for it to puts something
        # puts x
        # puts y

    ## Example 2
        # x = 10
        # puts x
        # puts y
        # y = 20
        # ruby runs top to bottom so `y = 20` must be before `puts y`

    ## Example 3
        # x = 10
        # def say_hello
        #   puts 'Hello World!'
        # end
        # puts x
        # method was never executed or invoked so why is it there?

    ## Example 4
        # def print_variable
        #   x = 4
        #   puts x
        # end

        # x = 2
        # print_variable
        # invoking print_variable method which has it's own `x = 4`

    ## Example 5
        # def print_variable
        #   x = 4
        # end

        # x = 2
        # print_variable
        # puts x
        # will give x=2. calling print_variable but no puts for it to print to console
        # putting `puts x` in the print_variable method has example return both 4 and 2


#### ARGUMENT SCOPE
    ## Example 10
        # def print_variable(x)
        #     puts x
        # end

        # print_variable(4)
        # will print 4 in console, no error

    ## Example 11
        # def print_variable(x)
        #   puts x
        # end

        # x = 4
        # print_variable(x)
        
        # #!returns 4 because giving x a value before calling on it in the method
        # defining global variable `x=4` and then 
        # passing that through the method scope via an argument

        ## Example 12
        # def print_variable(x)
        #   puts x
        # end

        # print_variable(2)
        # puts x
        # 2 is being stored as method variable
        # then x is undefined for the global scope

    ## Example 13
        # def print_variable(x)
        #     x = 4
        #     puts x
        # end

        # print_variable(2)
        # puts x
        # return 4 because x is defined as 4 in the method
        # error for global undefined x (line 89)

#### BLOCK SCOPE
    ## Example 14
        # numbers = [1, 2, 3]
        # total = 0
        # numbers.each do |number|
        #   total += number
        # end

        # p total
        # will add 1 + 2 + 3 + 0 all together to return 6 to the console

    ## Example 15
        # numbers = [1, 2, 3]
        # total = 0
        # numbers.each do |number|
        #   pizza = 'yummy!'
        #   total += number
        # end

        # p pizza
        # undefined local variable `pizza`

    ## Example 16
        # numbers = [1,2,3]
        # total = 0
        # numbers.each do |number|
        #   total += number
        # end

        # p number
        # defined `numbers` but not `number`

    ## Example 17
        # numbers = [1,2,3]
        # number = 0
        # numbers.each do |number|
        #   puts number
        # end
        # will put "1" "2" and "3" in the console - each # on their own lines

    ## Example 18
        # numbers = [1, 2, 3]
        # numbers.each do |number|
        #   number = 0
        #   puts number
        # end
        # returns "0" 3 times bc block runs 3 times for each variable and 
        # then number set to equal "0"

    ## Example 19
        numbers = [1,2,3]
        def number
          0
        end
        numbers.each do |number|
          puts number
        end
        
