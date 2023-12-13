def rot_13_decryptor
  a_to_m = ('a'..'m').to_a
  n_to_z = ('n'..'z').to_a
  alphabet_decoder = (a_to_m.zip(n_to_z) + n_to_z.zip(a_to_m) + [[' ', ' ']]).to_h
  decoded_names_arr = []

  File.open('encrypted-names.txt', 'r') do |file|
    file.each_line do |name|
      decoded_name = name.strip.chars.map { |char| alphabet_decoder[char.downcase] }
      decoded_names_arr << decoded_name.join.split.map(&:capitalize).join(' ')
    end
  end

  decoded_names_arr
end

puts rot_13_decryptor