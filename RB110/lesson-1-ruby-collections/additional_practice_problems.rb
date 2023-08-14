# Practice Problem 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flint_hash = {}

flintstones.each_with_index do |name, idx|
  flint_hash[name] = idx
end
# p flint_hash


# Practice Problem 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.sum


# Practice Problem 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |k, v| v < 100 }
# p ages


# Practice Problem 4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
cur_min = nil
ages.each do |_,v| 
  cur_min = v if cur_min == nil
  cur_min = v if v < cur_min
end
#p cur_min


# Practice Problem 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#p flintstones.index { |val| val.match?(/Be\w*/) }


# Practice Problem 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each_with_index { |name,idx| flintstones[idx] = name[0..2] }
#p flintstones


# Practice Problem 7
statement = "The Flintstones Rock"
statement_arr = statement.gsub(' ', '').chars
result_hash = {}
statement_arr.each do |char|
  if result_hash.include?(char)
    result_hash[char] += 1
  else
    result_hash[char] = 1
  end
end
#p result_hash


# Practice Problem 8
## The output of the first code is: 1 3
## The return value of the first code is: [3, 4]

## The output of the second code is: 1 2
## The return value is: [1, 2]


# Practice Problem 9
words = "the flintstones rock"
word_arr = words.split
word_arr.map! { |word| word.capitalize!}
words = word_arr.join(' ')
p words


# Practice Problem 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |person, values|
  if values["age"] >= 0 && values["age"] <= 17
    munsters[person]["age_group"] = "kid"
  elsif values["age"] >= 18 && values["age"] <= 64
    munsters[person]["age_group"] = "adult"
  else
    munsters[person]["age_group"] = "senior"
  end
end
p munsters