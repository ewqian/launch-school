class Banner
  def initialize(message, width = nil)
    @message = message
    @length = message.length
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    if (@width == nil) || (@length <= @width - 4)
      "+-#{'-' * @length}-+"
    else
      "+-#{'-' * (@width-4)}-+"
    end
  end

  def empty_line
    if (@width == nil) || (@length <= @width - 4)
      "| #{' ' * @length} |"
    else
      "| #{' ' * (@width-4)} |"
    end
  end

  def message_line
    if (@width == nil) || (@length <= @width - 4)
      "| #{@message} |"
    else
      msg = @message
      msg_arr = []

      until msg.length <= @width - 4
        slice_idx = @width - 5
        msg_arr << "| #{msg[0..slice_idx]} |"
        msg = msg[(slice_idx+1)..-1]
      end

      msg_arr << "| #{msg}#{' ' * (@width-msg.length-4)} |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
banner = Banner.new('')
puts banner
banner = Banner.new('To boldly go where no one has gone before.', 30)
puts banner