require './lib/dog'

max = Dog.new("Max")
puts max.woof

## Describe what each part of the code above did -
# `max` => local variable storing instance of the Dog class
# `Dog` => class
# `.woof` => calls woof on an instance

# puts Dog.woof
=begin
calls woof method on a class
=end

## Is there any difference between the two methods above? (max.woof and Dog.woof)?
=begin
calling woof on an object of the Dog class
Dog.woof calling woof on the class itself
=end

## Un-comment the line of code below, does it work? Why or why not?
# Dog.bark
=begin
doesn't work because bark is an instance method that we tried to call on a class object
=end

