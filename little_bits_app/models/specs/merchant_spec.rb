require('minitest/autorun')
require('minitest/rg')
require_relative('../merchant.rb')

class MerchantTest < MiniTest::Test

  def setup()
    @merchant_1 = Merchant.new({
      'id' => '1',
      'name' => 'Tesco'
      })
  end

  def test_can_create_merchant
    assert_equal(Merchant,@merchant_1.class)
  end

end
