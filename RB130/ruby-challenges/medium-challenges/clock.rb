class Clock
  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def self.at(hour, min=0)
    hour = hour.zero? ? 24 : hour
    Clock.new(hour, min)
  end

  def to_s
    hour_str = hour.to_s.length == 1 ? "0#{hour.to_s}" : hour.to_s
    min_str = min.to_s.length == 1 ? "0#{min.to_s}" : min.to_s
    hour_str + ":" + min_str
  end

  def +(add_min)
    total_min = (hour * 60) + min + add_min
    arithmetic_helper(total_min)
  end

  def -(sub_min)
    total_min = ((hour * 60) + min) - sub_min
    arithmetic_helper(total_min)
  end

  def ==(other)
    hour == other.hour && min == other.min
  end

  protected

  attr_reader :hour, :min

  private

  def arithmetic_helper(total_min)
    total_min = total_min.divmod(1440)[1] if total_min > 1440 || total_min < 0
    new_hour, new_min = total_min.divmod(60)
    Clock.new(new_hour, new_min)
  end
end