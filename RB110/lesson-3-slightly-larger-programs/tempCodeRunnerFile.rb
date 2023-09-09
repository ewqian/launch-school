def busted?(hand)
  hand = hand.map { |val| %w(Jack Queen King).include?(val) ? 10 : val }
  no_ace_sum = hand.select { |val| val != "Ace" }.sum

  hand.count("Ace").times do
    ace_index = hand.index("Ace")
    hand[ace_index] = (11 + no_ace_sum <= 21 ? 11 : 1)
    no_ace_sum += hand[ace_index]
  end

  p hand.sum > 21
end

busted?(["King", 4, "Ace"])