def xor?(op1, op2)
  return true if (op1 == true && op2 == false) || (op1 == false && op2 == true)
  return false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false