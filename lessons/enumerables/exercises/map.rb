# The method below returns an array of the brothers names in all caps using the method #each.
# # Your Task: Update this method to use #map. 


#Method using `.each`
def kennedy_brothers
    brothers = ["Robert", "Ted", "Joseph", "John"]
  
    caps_brothers = []
  
    brothers.each do |brother|
      caps_brothers << brother.upcase
    end
  
    caps_brothers
end

def kennedy_brothers
  brothers = ["Robert", "Ted", "Joseph", "John"]
  

p kennedy_brothers