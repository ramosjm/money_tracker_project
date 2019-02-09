require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction.rb')

class TransactionTest < MiniTest::Test

  def setup()
    @transaction_1 = Transaction.new({
      'id' => 1,
      'amount' => 12.50,
      'tag_id' => 2,
      'merchant_id' => 3
    })
  end

  def test_can_create_transaction()
    assert_equal(Transaction,@transaction_1.class)
  end

  def test_can_get_amount()
    assert_equal(12.50,@transaction_1.amount)
  end

  def test_can_get_transaction_id()
    assert_equal(1,@transaction_1.id)
  end

  def test_can_get_tag_id()
    assert_equal(2,@transaction_1.tag_id)
  end

  def test_get_merchant_id()
    assert_equal(3,@transaction_1.merchant_id)
  end

end
