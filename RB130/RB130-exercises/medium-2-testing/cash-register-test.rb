require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "cash-register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  def setup
    @store_reg_1 = CashRegister.new(100)
    @transaction_1 = Transaction.new(50)
  end

  def test_accept_money
    @transaction_1.amount_paid = 50
    @store_reg_1.accept_money(@transaction_1)
    assert_equal(150, @store_reg_1.total_money)
  end

  def test_change
    @transaction_1.amount_paid = 60
    assert_equal(10, @store_reg_1.change(@transaction_1))
  end

  def test_give_receipt
    exp_reciept = "You've paid $50.\n"
    assert_output(exp_reciept) { @store_reg_1.give_receipt(@transaction_1) }
  end
end