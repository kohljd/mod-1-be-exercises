food_feelings = [{:pizza => "tasty"}, {:calzone => "also tasty"}]

# 1. what is food_feelings.count
2

# 2. what is food_feelings.first.count
1

# 3. how can I access the value "also tasty"
p food_feelings.last[:calzone]

# 4. how can I change the value “also tasty” to “super delicious”
food_feelings.last[:calzone] = "super delicious"