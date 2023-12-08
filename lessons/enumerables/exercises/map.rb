# The method below returns an array of the brothers names in all caps using the method #each.
# # Your Task: Update this method to use #map. 


#Method using `.each`
# def kennedy_brothers
#     brothers = ["Robert", "Ted", "Joseph", "John"]
  
#     upcaps_brothers = []
  
#     brothers.each do |brother|
#       upcaps_brothers << brother.upcase
#     end
  
#     upcaps_brothers
# end

def kennedy_brothers
  brothers = ["Robert", "Ted", "Joseph", "John"]

  brothers.map do |brother|
    brother.upcase
  end
end

p kennedy_brothers