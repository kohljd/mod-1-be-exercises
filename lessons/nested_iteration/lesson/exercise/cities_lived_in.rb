cities_lived_in = {
    michaela: ["Philadelphia", "Fort Collins", "Seattle"],
    mike: ["Denver", "Santa Fe", "Philadelphia", "Portland"],
    pamela: ["Lansing"],
    alex: ["Seattle", "Columbus", "Philadelphia", "Austin"]
}


# Problem #1: 
# Get a unique list of all of the cities that these humans have lived in  
# ["Philadelphia", "Fort Collins", "Seattle", "Denver", "Santa Fe", "Portland", "Lansing", "Columbus", "Austin"]

#underscore is a place holder for the people's names, don't need the people's names bc not calling them at the moment
# cities_list = []

# cities_lived_in.each do |_, cities|
#     cities.each do |city_name|
#         cities_list << city_name unless cities_list.include?(city_name)
#     end
# end

# p cities_list

# #another way to do it
# cities_list = []

# cities_lived_in.each do |_, cities|
#     cities.each do |city_name|
#         if cities_list.include?(city_name) == false
#             cities_list << city_name
#         end
#     end
# end

# p cities_list



# Problem #2: 
# Write code that iterates through the `cities_lived_in` hash, and returns a list of  
# names of the humans who've lived in Philadelphia.
# philly_residents = []

# cities_lived_in.each do |resident, cities|
#     philly_residents << resident if cities.include?("Philadelphia")
# end

# p philly_residents

#another way
philly_residents = []

cities_lived_in.each do |resident, cities|
    if cities.include?("Philadelphia")
        philly_residents << resident 
    end
end

p philly_residents.map! {|name| name.to_s.capitalize}
# [:michaela, :mike, :alex]
# or
# ["Michaela", "Mike", "Alex"]




# Problem #3: 
# Create a hash that has the city as a key, and the number of people that live in it as it's value: 

# {
#     "Philadelphia" => 3,
#     "Fort Collins" => 1,
#     "Seattle" =>2,
#     "Denver" => 1,
#     "Santa Fe" => 1,
#     "Portland" => 1,
#     "Lansing" => 1,
#     "Columbus => 1,
#     "Austin" => 1
# }
# number_of_people_per_city = {}
# list_of_cities.each do |city|
#     number_of_people_per_city[city] = 0
# end

# cities_lived_in.each do |name, cities| 
#     list_of_cities. each do |city| 
#         if cities.include?(city)
#             number_of__people_per_city[city] += 1
#         end
#     end
# end

# #another way
# cities_population = Hash.new(0)
# cities_lived_in.each do |person, cities|
#     cities.each do |city|
#         cities_population[city] += 1
#     end
# end
# p cities_population

# #another way
# cities_population = {}
# cities_lived_in.each do |person, cities|
#     cities.each do |city|
#         if cities_population. include(city)
#             cities_population[city] += 1
#         else
#             cities_population[city] = 1
#         end
#     end
# end