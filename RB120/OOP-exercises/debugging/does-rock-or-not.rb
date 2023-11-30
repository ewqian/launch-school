require 'pry'

class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A' #'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)

      (positive * 100) / (positive + negative)
      100/0
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...40
      "#{term} is not fun."
    when 40...60
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

# Issue 1
# The AuthenticationError is raised, but the Score::for_term method catches it, so it never reaches
  # the DoesItRock::find_out method.

# Solution 1
# have the AuthenticationError inherit from Standard Error which we'll use instead of Exception
  # since it's more specific and still allows the system to raise more critical issues
# in the Score method change this to  ZeroDivisionError where we'll let a value to return so that
  # the case statement within the find_out method can execute
# for an AuthenticationError catch it in the find_out method

# Issue 2
# When the return value of Score::for_term is NoScore, the case statement in DoesItRock::find_out
  # does not behave as expected.

# Solution 2
# "#{term} rocks!" is outputted everytime because of how case statements are implemented.
# they use Object#=== which by default determines if the case value is an instance of the class
  # provided in the when conditional
# so the statement NoClass === NoClass is false because NoClass is not an instance of itself
# change the rescue StandardError to NoScore.new to fix this
