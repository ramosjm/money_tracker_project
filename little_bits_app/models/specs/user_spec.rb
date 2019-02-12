require('minitest/autorun')
require('minitest/rg')
require_relative('../user.rb')

class UserTest < MiniTest::Test

  def setup()
    @user_1 = User.new({
      'first_name' => 'will',
      'last_name' => 'smith',
      'budget' => 1320.40
      })
  end

  def test_can_create_user()
    assert_equal(User,@user_1.class)
  end

end
