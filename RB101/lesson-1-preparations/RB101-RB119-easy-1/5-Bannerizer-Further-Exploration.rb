def print_in_box_truncated(message)
  outer = message.length > 76 ? "+#{'-' * (78)}+" : "+#{'-' * (message.length+2)}+"
  inner = message.length > 76 ? "|#{' ' * (78)}|" : "|#{' ' * (message.length+2)}|"
  message = message.length > 76 ? "| #{message[0..72]}... |" : "| #{message} |"

  puts outer
  puts inner
  puts message
  puts inner
  puts outer
end

#print_in_box_truncated("wherefore art thou romeo")
#print_in_box_truncated("The quick brown fox jumps over the lazy dog. Sphinx of black quartz, judge my vow! Pack my box with five dozen liquor jugs.")

def print_in_box_full(message)
  outer = message.length > 76 ? "+#{'-' * (78)}+" : "+#{'-' * (message.length+2)}+"
  inner = message.length > 76 ? "|#{' ' * (78)}|" : "|#{' ' * (message.length+2)}|"
  times = 4 + (message.length/76.0).ceil
  split_message_arr = []

  if message.length <= 76
    split_message_arr << "| #{message} |"
  else
    split_message_arr = message.scan(/.{1,76}/)
    split_message_arr.each_with_index do |str, i| 
      str.prepend("| ")
      if i == (split_message_arr.length - 1)
        str << "#{' ' * (78-split_message_arr[i].length)} |"
      else str << " |" end
    end
  end
  
  for i in (1..times) do
    if i == 1 || i == times
      puts outer
    elsif i == 2 || i == (times-1)
      puts inner
    else 
      puts split_message_arr[0]
      split_message_arr.shift
    end
  end
end

#print_in_box_full("wherefore art thou romeo")
#print_in_box_full("The quick brown fox jumps over the lazy dog. Sphinx of black quartz, judge my vow! Pack my box with five dozen liquor jugs.")
print_in_box_full("The quick brown fox jumps over the lazy dog. This is a sample sentence. Ruby programming language is powerful and flexible. OpenAI's ChatGPT is an impressive language model. Today is a beautiful day. Learning new things is always exciting. Keep exploring and expanding your knowledge. Practice makes perfect. Enjoy the journey!")
