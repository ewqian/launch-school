def longest_sentence(text_file)
  str = File.read(text_file)
  str.gsub!("\n", " ").gsub!("\r", " ")
  str_arr = str.split(/[.!?]/)
  str_arr.map! { |sentence| [sentence, sentence.split.length] }
  str_arr.sort_by! { |_, sentence_length| sentence_length }

  puts "The longest sentence is:\n\"#{str_arr.last[0].strip}\"."
  puts "\nIt is #{str_arr.last[1]} words long."
end

example_text = File.new('example_text.txt')
longest_sentence(example_text)

gutenberg_text = File.new('gutenberg.txt')
longest_sentence(gutenberg_text)
