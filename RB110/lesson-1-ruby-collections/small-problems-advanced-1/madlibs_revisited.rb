file_path = "madlibs_example.txt"
txt_arr = File.readlines(file_path)

adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(jumps lifts bites licks)
adverbs = %w(easily lazily nosily excitedly)

txt_arr.each do |line|
  line.gsub!("%{adjective}", adjectives.sample)
  line.gsub!("%{noun}", nouns.sample)
  line.gsub!("%{verb}", verbs.sample)
  line.gsub!("%{adverb}", adverbs.sample)
  puts line
end