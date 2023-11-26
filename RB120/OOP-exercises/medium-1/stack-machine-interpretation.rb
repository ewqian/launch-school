class Minilang
  def initialize(string)
    @stack = []
    @register = 0
    @commands_arr = string.split
  end

  def n(int_str)
    @register = int_str.to_i
  end

  def push
    @stack.push(@register)
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    @register = @stack.pop
  end

  def print
    puts (@register.nil? ? "Empty stack!" : @register)
  end

  def eval
    begin
      @commands_arr.each do |command|
        if (command =~ /\A[-+]?\d+\z/) then self.send(:n, command)
        else self.send(command.downcase) end
      end
    rescue NoMethodError => exception
      puts "Invalid token: #{exception.name.upcase}"
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)