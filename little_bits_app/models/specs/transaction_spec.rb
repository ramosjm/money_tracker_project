require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction.rb')

class TransactionTest < MiniTest::Test

  def setup()
    @transaction_1 = Transaction.new({
      'id' => 1,
      'amount' => 12.50,
      'tag_id' => 1,
      'merchant_id' => 1
    })
  end

  def test_can_create_transaction()
    assert_equal(Transaction,@transaction_1.class)
  end

  def test_can_get_amount()
    assert_equal(12.50,@transaction_1.amount)
  end

end
