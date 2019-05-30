# 1. Build a method, `get_first_name_of_season_winner`, that takes in two arguments, a hash called `data` (i.e. the data structure described above), and a season. The method should return the *first name* of that season's winner. **Hint**: you'll need to do some string manipulation to return only the first name of the winning lady. 
#   * Think about how you will iterate through the hash to get to the level that contains a contestant's status. 
#   * How will you check to see if a contestant's status equals "Winner"?

def get_first_name_of_season_winner(data, season)
  data[season].find { |p| p['status'] == 'Winner' }['name'].split.first
end

# 2. Build a method, `get_contestant_name`, that takes in the data hash and an occupation string and returns the name of the woman who has that occupation. 

def get_contestant_name(data, occupation)
  data.values.reduce([], :concat).find { |p| p['occupation'] == occupation }['name']
end

# 3. Build a method, `count_contestants_by_hometown`, that takes in two arguments––the data hash and a string of a hometown. This method should return a counter of the number of contestants who are from that hometown. 
#   * How will you keep track of contestants from a particular hometown? Think back to our looping lessons in which we set a counter variable equal to 0 and incremented that counter under certain conditions. 

def count_contestants_by_hometown(data, hometown)
  data.values.reduce([], :concat).select { |p| p['hometown'] == hometown }.size
end

# 4. Build a method `get_occupation`, that takes in two arguments––the data hash and a string of a hometown. It returns the occupation of the first contestant who hails from that hometown.

def get_occupation(data, hometown)
  data.values.reduce([], :concat).select { |p| p['hometown'] == hometown }.first['occupation']
end

# 5. Build a method, `get_average_age_for_season`, that takes in two arguments––the data hash and a string of a season. Iterate through the hash and return the average age of all of the contestants for that season. 
#   * How will you iterate down into the level of the hash that contains each contestant's age?
#   * How will you collect the ages of each contestant and average them? Remember that the values of the "age" keys are not numbers, they are strings. How do we convert strings to numbers in Ruby?
#   * Remember that dividing *integers* in Ruby always rounds down. In this case though, we want the normal math sort of rounding (where .5 and higher rounds *up*), instead. Consider the difference between `to_f` and `to_i`.

def get_average_age_for_season(data, season)
  s = data[season]
  sum = 0

  for c in s do
  	sum += c['age'].to_f
  end

  f = (sum / s.size)
  f.ceil
end
