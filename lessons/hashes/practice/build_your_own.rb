# Your turn to create a hash. Make sure to use symbols for the keys.

# Create your hash here

# 1. Create a hash called new_band.
new_band = {}

# 2. Add a bassist to your new_band hash.
new_band[:bassist] = "Guitar Man"

# 3. Find the name of your bassist by accessing the :bassist key in the new_band hash.
new_band[:bassist]

# 4. Find the value attached to :vocalist in your hash.
new_band[:vocalist].class

# 5. Add a vocalist to your hash.
new_band[:vocalist] = "Singer Gal"

# 6. Add a drummer to your hash.
new_band[:drummer] = "Drummer Boy"

# 8. Get all the values in your Hash. What kind of object does that method return?
puts new_band.values
# => returns an array w/a list of the keys' values

# 9. Assign a new value to the :vocalist key of your hash.
new_band[:vocalist] = "I'm No Sinatra"

# 10. How has keys changed after the last step? How has values changed?
puts new_band.values
# value of the key changed from the original (Singer Gal) to the new value (I'm No Sinatra)