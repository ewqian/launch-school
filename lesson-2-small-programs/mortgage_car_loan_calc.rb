require 'pry'

def prompt(msg_str)
  puts "=> #{msg_str}"
end

def valid_loan?(loan_amount_str) # matches raw numbers & numbers in a standard currency format (USD)
  loan_amount_str.match?(/\A(\$?\d+\,?\d+)+(\.\d+)?\z/)
end

def valid_apr?(apr_str) # matches raw numbers & properly formatted percentages
  apr_str.match?(/\A\d+(\.\d+)?\%?/)
end

def valid_duration?(years, months)
  years.match?(/\A\d+\z/) && months.match?(/\A\d+\z/)
end

prompt("What's your loan amount?")
loan_amount = nil
loop do
  loan_amount = gets.chomp
  break if valid_loan?(loan_amount)
  prompt("Please enter a valid loan amount.")
end
# convert loan_amount to a valid float
if loan_amount.include?('$') || loan_amount.include?(',')
  loan_amount = loan_amount.gsub!(/[$,]/, '').to_f
else
  loan_amount = loan_amount.to_f
end

prompt("What's your Annual percentage Rate (APR)?")
annual_percentage_rate = nil
loop do
  annual_percentage_rate = gets.chomp
  break if valid_apr?(annual_percentage_rate)
  prompt("Please enter a valid annual percentage rate.")
end
# convert annual_percentage_rate to a valid float and then convert to monthly interest rate
annual_percentage_rate.gsub!(/[%]/, '') if annual_percentage_rate.include?('%')
monthly_interest_rate = (annual_percentage_rate.to_f / 100) / 12

prompt("What's your loan duration?")
prompt("  First, you'll be prompted for the years in your loan duration.")
prompt("  Then you'll be prompted for the months in your loan duration.")
prompt("NOTE: If you're loan duration is solely in years, then you can enter '0' when prompted for the months in your loan.")
puts ""
loan_duration_y = nil
loan_duration_m = nil
loop do
  prompt("How many years are in the duration of your loan?")
  loan_duration_y = gets.chomp
  prompt("How many months are in the duration of your loan?")
  loan_duration_m = gets.chomp
  break if valid_duration?(loan_duration_y, loan_duration_m)
  prompt("Please enter a valid loan duration.")
end
# convert loan duration to months
loan_duration = (loan_duration_y.to_i * 12) + loan_duration_m.to_i

# calculate monthly payment & output results to user
monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration)))
prompt("Your monthly payment is $#{monthly_payment.round(2)} that you'll pay over #{loan_duration} months at a #{(monthly_interest_rate*100).round(2)}% monthly interest rate.")