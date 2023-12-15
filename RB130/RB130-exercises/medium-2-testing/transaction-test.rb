require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "transaction"
require_relative "cash-register"

class TransactionTest < Minitest::Test
  def setup
    @store_reg_1 = CashRegister.new(100)
    @transaction_1 = Transaction.new(50)

    @store_reg_2 = CashRegister.new(100)
    @transaction_2 = Transaction.new(50)

    @store_reg_3 = CashRegister.new(100)
    @transaction_3 = Transaction.new(50)
  end

  def test_prompt_for_payment
    $stdout = StringIO.new
    
    input_1 = StringIO.new("30\n")
    assert_raises { @transaction_1.prompt_for_payment(input: input_1) }

    input_2 = StringIO.new("50\n")
    @transaction_2.prompt_for_payment(input: input_2)
    assert_equal(50, @transaction_2.amount_paid)

    input_3 = StringIO.new("60\n")
    @transaction_3.prompt_for_payment(input: input_3)
    assert_equal(60, @transaction_3.amount_paid)
  end
end