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
        # puts x
        # end

        # print_variable(4)

    ## Example 11
        # def print_variable(x)
        #   puts x
        # end

        # x = 4
        # print_variable(x)

    ## Example 12
        # def print_variable(x)
        #   puts x
        # end

        # print_variable(2)
        # puts x

    ## Example 13
        # def print_variable(x)
        # x = 4
        # puts x
        # end

        # print_variable(2)
        # puts x

#### BLOCK SCOPE
    ## Example 14
        # numbers = [1, 2, 3]
        # total = 0
        # numbers.each do |number|
        #   total += number
        # end

        # p total

    ## Example 15
        # numbers = [1, 2, 3]
        # total = 0
        # numbers.each do |number|
        #   pizza = 'yummy!'
        #   total += number
        # end

        # p pizza

    ## Example 16
        # numbers = [1,2,3]
        # total = 0
        # numbers.each do |number|
        #   total += number
        # end

        # p number

    ## Example 17
        # numbers = [1,2,3]
        # number = 0
        # numbers.each do |number|
        #   puts number
        # end

    ## Example 18
        # numbers = [1, 2, 3]
        # numbers.each do |number|
        #   number = 0
        #   puts number
        # end

    ## Example 19
        # numbers = [1,2,3]
        # def number
        #   0
        # end
        # numbers.each do |number|
        #   puts number
        # end
