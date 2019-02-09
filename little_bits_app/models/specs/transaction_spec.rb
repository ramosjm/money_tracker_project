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

end
