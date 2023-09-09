# 1
arr = ['10', '11', '9', '7', '8']
arr.sort_by { |v| -(v.to_i) } # My solution
arr.sort { |a, b| b.to_i <=> a.to_i } # LS solution


# 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
books.sort_by { |hash| hash[:published].to_i }


# 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]


# 4
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
#p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
#p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
#p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
#p hsh2


# 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_munsters = munsters.select do |_, v|
  v["gender"] == "male"
end

total_age = male_munsters.inject(0) do |sum, (_, v)|
  sum + v["age"]
end

#p total_age


# 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |k, v|
#  puts "#{k} is a #{v["age"]}-year-old #{v["gender"]}"
end


# 7
## a => 2
## b => [3, 8]
## WHY? Come back to this


# 8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %w(a e i o u)
hsh.each do |_, v|
#  v.each { |str| str.chars.each { |char| puts char if VOWELS.include?(char) } }
end


# 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map { |sub_arr| sub_arr.sort.reverse }
#p new_arr


# 10
a = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

ret_arr = a.map do |hsh| 
  new_hsh = {}
  hsh.each do |k, v| 
    new_hsh[k] = v + 1
  end
  new_hsh
end
#p a
#p ret_arr


# 11
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

ret_arr = arr.map do |sub_arr|
  sub_arr.select { |v| v % 3 == 0 }
end
#p arr
#p ret_arr


# 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hash = arr.each_with_object({}) do |v, h|
  h[v[0]] = v[1]
end
#p hash


# 13
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

ret_arr = arr.sort_by do |sub_arr|
  sub_arr.select { |num| num.odd? }
end
#p arr
#p ret_arr


# 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

ret_arr = []
hsh.each do |k, v|
  ret_arr << (v[:type] == 'fruit' ? v[:colors].map(&:capitalize) : v[:size].upcase)
end
#p ret_arr


# 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
ret_arr = arr.select do |hsh|
  hsh.values.flatten.all? { |num| num.even? }
end
#p ret_arr


# 16
def uuid
  "#{rand_chars(8)}-#{rand_chars(4)}-#{rand_chars(4)}-#{rand_chars(4)}-#{rand_chars(12)}"
end

def rand_chars(int)
  ret_str = ""
  all_chars = ('1'..'9').to_a + ('a'..'z').to_a
  int.times { ret_str << all_chars.sample }
  ret_str
end

#p uuid()