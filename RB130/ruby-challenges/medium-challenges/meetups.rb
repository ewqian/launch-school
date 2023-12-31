require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end
  
  def day(weekday, schedule)
    day = find_day(weekday.capitalize, schedule.downcase)
    Date.valid_date?(year, month, day) ? Date.new(year, month, day) : nil
  end

  private

  DAY_TO_NUM = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).zip((1..7)).to_h
  SCHED_TO_NUM = %w(first second third fourth fifth).zip((0..4)).to_h

  attr_reader :year, :month

  def find_day(weekday, schedule)
    if SCHED_TO_NUM.key?(schedule)
      offset = get_offset(weekday)
      offset + (7 * SCHED_TO_NUM[schedule])
    elsif schedule == 'last'
      get_offset(weekday, true)
    elsif schedule == 'teenth'
      (13..19).each do |teenth|
        return teenth if Date.new(year, month, teenth).send("#{weekday.downcase}?")
      end
    end
  end

  def get_offset(weekday, last=false)
    if last
      last_day = Date.new(year, month, -1).cwday
      offset = last_day - DAY_TO_NUM[weekday]
      offset = offset < 0 ? -(offset + 7) : -offset
    else
      first_day = Date.new(year, month, 1).cwday
      offset = DAY_TO_NUM[weekday] - first_day
      offset += 7 if offset < 0
    end

    last ? offset - 1 : offset + 1
  end
end